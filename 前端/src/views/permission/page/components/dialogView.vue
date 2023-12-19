<template>
  <el-dialog
    v-model="visible"
    :title="bookData ? '修改图书信息' : '添加图书信息'"
    :before-close="close"
  >
    <el-form
      label-position="right"
      label-width="100px"
      :model="ruleForm"
      ref="ruleFormRef"
    >
      <el-form-item label="书籍名字" prop="title">
        <el-input v-model="ruleForm.title" />
      </el-form-item>
      <el-form-item label="书籍作者" prop="author">
        <el-input v-model="ruleForm.author" />
      </el-form-item>
      <el-form-item label="出版社" prop="publisher">
        <el-input v-model="ruleForm.publisher" />
      </el-form-item>
      <el-form-item label="书籍ISBN码" prop="isbn">
        <el-input v-model="ruleForm.isbn" />
      </el-form-item>
      <el-form-item label="库存" prop="stock">
        <el-input v-model="ruleForm.stock" />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="close">取消</el-button>
        <el-button type="primary" @click="onUpdate(ruleFormRef)">
          {{ bookData ? "确定修改" : "确认添加" }}
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, defineProps, defineEmits, watch, reactive } from "vue";
import { updateBook } from "@/api/user";
import { message } from "@/utils/message";
import type { FormInstance } from "element-plus";

const ruleFormRef = ref<FormInstance>();
const emit = defineEmits(["closeDialog", "success_update"]);
const props = defineProps({
  outerVisible: {
    type: Boolean,
    default: false
  },
  data: {
    type: Object,
    default: () => {
      return {};
    }
  }
});

const bookData = ref(props.data);
const visible = ref<boolean>(false);
watch(
  () => props.outerVisible,
  val => (visible.value = val)
);
watch(
  () => props.data,
  val => (bookData.value = val)
);
const ruleForm = ref({
  id: "",
  title: "",
  author: "",
  publisher: "",
  isbn: "",
  stock: ""
});

watch(
  () => bookData.value,
  val =>
    (ruleForm.value = reactive({
      id: val.id,
      title: val.title,
      author: val.author,
      publisher: val.publisher,
      isbn: val.isbn,
      stock: val.stock
    }))
);

const close = () => {
  emit("closeDialog", false);
};

const onUpdate = async (formEl: FormInstance | undefined) => {
  if (!formEl) return;
  await formEl.validate((valid, fields) => {
    if (valid) {
      // 模拟请求，需根据实际开发进行修改
      updateBook(ruleForm.value).then(res => {
        if (res.success) {
          setTimeout(() => {
            message(res.message, {
              type: "success"
            });
          }, 500);
          emit("success_update");
        } else {
          setTimeout(() => {
            message(res.message, {
              type: "error"
            });
          }, 500);
        }
      });
    } else {
      return fields;
    }
    close();
  });
};
</script>
<style scoped>
.dialog-footer button:first-child {
  margin-right: 10px;
}
</style>
