<template>
  <el-dialog v-model="visible" title="确认申请" :before-close="close">
    <el-descriptions title="书籍信息">
      <el-descriptions-item label="书籍ID">{{
        bookData.id
      }}</el-descriptions-item>
      <el-descriptions-item label="书籍名称">{{
        bookData.title
      }}</el-descriptions-item>
      <el-descriptions-item label="书籍作者">{{
        bookData.author
      }}</el-descriptions-item>
      <el-descriptions-item label="出版社">{{
        bookData.publisher
      }}</el-descriptions-item>
      <el-descriptions-item label="ISBN">{{
        bookData.isbn
      }}</el-descriptions-item>
      <el-descriptions-item label="库存"
        >{{ bookData.stock }}
        <el-tag size="small" :type="bookData.stock == 0 ? 'danger' : ''">{{
          bookData.stock > 0 ? "充足" : "缺书"
        }}</el-tag></el-descriptions-item
      >
      <el-descriptions-item>
        <el-text class="mx-1" type="danger" size="large"
          >*为避免图书资源浪费，请于24h内到图书馆取书，否则将自动取消预约申请</el-text
        ></el-descriptions-item
      >
    </el-descriptions>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="close">取消</el-button>
        <el-button type="primary" @click="sure"> 确定预约 </el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, defineProps, defineEmits, watch } from "vue";
import { reserveBook } from "@/api/user";
import { message } from "@/utils/message";
const emit = defineEmits(["closeDialog"]);
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

const close = () => {
  emit("closeDialog", false);
};

const sure = () => {
  reserveBook(bookData);
  message("成功预约", { type: "success" });
  close();
};
</script>
<style scoped>
.dialog-footer button:first-child {
  margin-right: 10px;
}
</style>
