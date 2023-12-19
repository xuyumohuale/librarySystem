<template>
  <el-card class="box-card">
    <template #header>
      <div class="card-header">
        <div style="display: grid; grid-template-columns: 3fr 1fr">
          <span>图书列表</span>
          <div class="mt-4" style="display: inline-block; right: 30px">
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
          style="width: 100%"
        >
          <el-table-column label="ID" prop="id" />
          <el-table-column label="书名" prop="title" />
          <el-table-column label="作者" prop="author" />
          <el-table-column label="库存" prop="stock" sortable />
          <el-table-column align="right">
            <template #default="scope">
              <el-button
                size="default"
                type="success"
                @click="reserve(scope.row)"
                >预约借书</el-button
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
  <dialogView
    :outerVisible="dialogShow"
    :data="selected_book"
    @success_reserve="findAndSetBooks"
    @closeDialog="closeDialog"
  />
</template>

<script lang="ts" setup>
import { computed, ref } from "vue";
import { onMounted, watchEffect } from "vue";
import { book, findBooks } from "@/api/user";
import dialogView from "./dialogView.vue";
const selected_book = ref<book>();
const list = ref<book[]>([]);
const select = ref("1");
const dialogShow = ref<boolean>(false);

const findAndSetBooks = async () => {
  list.value = await findBooks();
};

onMounted(() => {
  findAndSetBooks();
});

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
const closeDialog = (p: boolean) => {
  dialogShow.value = p;
};
const search = ref("");
const filterTableData = computed(() =>
  list.value.filter(data => {
    const searchValue = search.value.toLowerCase();

    if (!searchValue) return true; // 不进行筛选

    // 根据 select.value 进行不同的筛选
    if (
      select.value === "1" &&
      String(data.id).toLowerCase().includes(searchValue)
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
const reserve = (row: book) => {
  selected_book.value = row;
  dialogShow.value = true;
};
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
