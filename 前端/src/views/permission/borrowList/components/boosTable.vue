<template>
  <el-card class="box-card">
    <template #header>
      <div class="card-header">
        <div
          style="
            display: grid;
            grid-template-columns: 1fr 14fr 4fr;
            justify-items: end;
          "
        >
          <span>已借书籍 </span>
          <div>
            <el-button round @click="changeState(-1)">所有</el-button>
            <el-button round @click="changeState(0)">已归还</el-button>
            <el-button round type="warning" @click="changeState(1)"
              >预约中</el-button
            >
            <el-button round type="success" @click="changeState(2)"
              >借阅中</el-button
            >
          </div>
          <div style="display: inline-block">
            <el-input
              v-model="search"
              :placeholder="select_name"
              class="input-with-select"
            >
              <template #prepend>
                <el-button>
                  <el-icon><Search /></el-icon>
                </el-button>
              </template>
              <template #append>
                <el-select v-model="select" style="width: 115px">
                  <el-option label="ID" value="1" />
                  <el-option label="书名" value="2" />
                  <el-option label="作者" value="3" />
                </el-select>
              </template>
            </el-input>
          </div>
        </div>
      </div>
    </template>

    <div class="example-pagination-block">
      <div class="example-demonstration">
        <el-table
          :data="
            filterTableData.slice(
              (currpage - 1) * pagesize,
              currpage * pagesize
            )
          "
          @sort-change="sortChange"
          style="width: 100%"
        >
          <el-table-column label="借阅ID" prop="record_id" />
          <el-table-column label="用户ID" prop="book_id" />
          <el-table-column label="书籍ID" prop="book_id" />
          <el-table-column label="书名" prop="title" />
          <el-table-column label="作者" prop="author" />
          <el-table-column
            label="借阅时间"
            prop="borrow_date"
            sortable="custom"
          >
            <template v-slot="{ row }">
              {{ formatDate(row.borrow_date) }}
            </template>
          </el-table-column>
          <el-table-column label="还书期限" prop="return_date" sortable>
            <template v-slot="{ row }">
              {{ formatDate(row.return_date) }}
            </template>
          </el-table-column>
          <el-table-column label="归还时间" prop="shiji_return_date" sortable>
            <template v-slot="{ row }">
              {{ formatDate(row.shiji_return_date) }}
            </template>
          </el-table-column>
          <el-table-column label="状态" prop="status">
            <template v-slot="{ row }">
              {{ mapStatus(row.status) }}
            </template>
          </el-table-column>
          <el-table-column align="right">
            <template #default="scope">
              <el-button
                round
                :type="
                  button(scope.row.status) == '借出' ? 'warning' : 'success'
                "
                @click="
                  button(scope.row.status) == '借出'
                    ? sureLend(scope.row)
                    : sureReturn(scope.row)
                "
                v-if="button(scope.row.status)"
                >{{ button(scope.row.status) }}</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </div>
      <div
        class="demo-pagination-block"
        style="display: flex; justify-content: flex-end; margin-top: 25px"
      >
        <el-pagination
          v-model:current-page="currpage"
          v-model:page-size="pagesize"
          layout="prev, pager, next, jumper"
          :total="total"
          @current-change="handleCurrentChange"
        />
      </div>
    </div>
  </el-card>
</template>

<script lang="ts" setup>
import { computed, ref } from "vue";
import { onMounted, watchEffect, watch } from "vue";
import { borrow, allBorrow } from "@/api/user";
import { useUserStoreHook } from "@/store/modules/user";

import { message } from "@/utils/message";
import { ElMessage, ElMessageBox } from "element-plus";
import type { Action } from "element-plus";
import { ReturnBook, ConfirmLend } from "@/api/user";
const sortChange = column => {
  console.log(list.value);
  if (column.order === "ascending") {
    console.log("ascending");
    list.value = list.value.sort((a, b) => {
      return +new Date(a.return_date) - +new Date(b.return_date);
    });
  } else if (column.order == "descending") {
    console.log("descending");
    list.value = list.value.sort((a, b) => {
      return +new Date(b.return_date) - +new Date(a.return_date);
    });
  }
};
const open1 = (row: borrow) => {
  ElMessageBox.alert("确定借出吗", "提示", {
    confirmButtonText: "确定",
    callback: (action: Action) => {
      if (action === "confirm") {
        ConfirmLend({
          userid: row.user_id,
          bookid: row.book_id
        }).then(res => {
          if (res.success) {
            findAllBorrows();
            setTimeout(() => {
              message(res.message, {
                type: "success"
              });
            }, 500);
          } else {
            setTimeout(() => {
              message(res.message, {
                type: "error"
              });
            }, 500);
          }
        });
      } else {
        ElMessage({
          type: "info",
          message: "取消操作"
        });
      }
    }
  });
};
const open2 = (row: borrow) => {
  ElMessageBox.alert("确定归还吗", "提示", {
    confirmButtonText: "确定",
    callback: (action: Action) => {
      if (action === "confirm") {
        ReturnBook({
          userid: row.user_id,
          bookid: row.book_id
        }).then(res => {
          if (res.success) {
            findAllBorrows();
            setTimeout(() => {
              message(res.message, {
                type: "success"
              });
            }, 500);
          } else {
            setTimeout(() => {
              message(res.message, {
                type: "error"
              });
            }, 500);
          }
        });
      } else {
        ElMessage({
          type: "info",
          message: "取消操作"
        });
      }
    }
  });
};

const list = ref<borrow[]>([]);
const templist = ref<borrow[]>([]);
const state = ref<number>(-1);
const select = ref("1");
const dialogShow = ref<boolean>(false);
const userid = () => {
  return useUserStoreHook()?.id;
};
const mapStatus = status => {
  const statusMap = {
    0: "已归还",
    1: "预约中",
    2: "借出"
    // 添加其他状态映射...
  };
  return statusMap[status] || "未知状态";
};
const button = status => {
  const statusMap = {
    1: "借出",
    2: "归还"
    // 添加其他状态映射...
  };
  return statusMap[status] || "";
};
const formatDate = dateString => {
  if (dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString(); // 你可以使用其他日期格式化方式}
  } else {
    return "还未归还";
  }
};
const findAllBorrows = async () => {
  list.value = await allBorrow({ userid: userid() });
  changeTemp(state.value);
};
onMounted(() => {
  findAllBorrows();
});
const sureLend = (row: borrow) => {
  dialogShow.value = true;
  open1(row);
  return row;
};
const sureReturn = (row: borrow) => {
  dialogShow.value = true;
  open2(row);
  return row;
};
const select_name = computed(() => {
  if (select.value === "1") {
    return "输入图书ID进行搜索";
  } else if (select.value === "2") {
    return "请输入图书名字进行搜索";
  } else if (select.value === "3") {
    return "请输入图书作者进行搜索";
  } else {
    return "请输入搜索内容";
  }
});
const changeState = (s: number) => {
  state.value = s;
};
watch(
  () => state.value,
  newValue => {
    changeTemp(newValue);
  }
);
const changeTemp = state => {
  templist.value = list.value.filter(data => {
    if (data.status === state || state === -1) return true;
    else return false;
  });
};
const search = ref("");
const filterTableData = computed(() =>
  templist.value.filter(data => {
    const searchValue = search.value.toLowerCase();

    if (!searchValue) return true; // 不进行筛选

    // 根据 select.value 进行不同的筛选
    if (
      select.value === "1" &&
      String(data.book_id).toLowerCase().includes(searchValue)
    ) {
      return true;
    } else if (
      select.value === "2" &&
      data.title.toLowerCase().includes(searchValue)
    ) {
      return true;
    } else if (
      select.value === "3" &&
      data.author.toLowerCase().includes(searchValue)
    ) {
      return true;
    }

    return false;
  })
);
watchEffect(() => {
  list.value;
  filterTableData.value;
});
//当前页面
const currpage = ref<number>(1);
//页面大小
const pagesize = ref<number>(10);
//列表长度
const total = computed(() => filterTableData.value.length);
const handleCurrentChange = val => {
  currpage.value = val;
};
</script>

<style scoped>
.example-pagination-block + .example-pagination-block {
  margin-top: 10px;
}
</style>
