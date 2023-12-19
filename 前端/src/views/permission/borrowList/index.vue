<script setup lang="ts">
defineOptions({
  name: "Welcome"
});

import booksTable from "./components/boosTable.vue";
</script>

<template>
  <el-row :gutter="20">
    <el-col :span="24" style="padding-left: 20px; padding-right: 20px">
      <booksTable />
    </el-col>
  </el-row>
</template>
