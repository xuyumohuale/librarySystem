<template>
  <h2>
    <el-descriptions
      class="margin-top"
      title="个人信息"
      :column="3"
      size="large"
      border
    >
      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            <el-icon :style="iconStyle">
              <user />
            </el-icon>
            账号
          </div>
        </template>
        {{ username }}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            <el-icon :style="iconStyle">
              <tickets />
            </el-icon>
            姓名
          </div>
        </template>
        {{ name }}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            <el-icon :style="iconStyle">
              <tickets />
            </el-icon>
            ID
          </div>
        </template>
        {{ id }}
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            <el-icon :style="iconStyle">
              <tickets />
            </el-icon>
            注册日期
          </div>
        </template>
        {{ rdate }}
      </el-descriptions-item>
    </el-descriptions>
  </h2>
</template>

<script lang="ts" setup>
import { computed } from "vue";
import { useUserStoreHook } from "@/store/modules/user";
import { Tickets, User } from "@element-plus/icons-vue";

const iconStyle = computed(() => {
  const marginMap = {
    large: "8px",
    default: "6px",
    small: "4px"
  };
  return {
    marginRight: marginMap["larger"] || marginMap.default
  };
});

const username = computed(() => {
  return useUserStoreHook()?.username;
});
const id = computed(() => {
  return useUserStoreHook()?.id;
});

const rdate = computed(() => {
  return useUserStoreHook()?.registration_date;
});

const name = computed(() => {
  return useUserStoreHook()?.name;
});
</script>
