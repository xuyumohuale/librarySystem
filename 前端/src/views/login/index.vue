<script setup lang="ts">
import Motion from "./utils/motion";
import { useRouter } from "vue-router";
import { message } from "@/utils/message";
import { loginRules } from "./utils/rule";
import { useNav } from "@/layout/hooks/useNav";
import type { FormInstance } from "element-plus";
import { useLayout } from "@/layout/hooks/useLayout";
import { useUserStoreHook } from "@/store/modules/user";
import { initRouter, getTopMenu } from "@/router/utils";
import { illustration, book } from "./utils/static";
import { useRenderIcon } from "@/components/ReIcon/src/hooks";
import Info from "@iconify-icons/ri/information-line";
import {
  ref,
  reactive,
  toRaw,
  onMounted,
  onBeforeUnmount,
  computed
} from "vue";
import { useDataThemeChange } from "@/layout/hooks/useDataThemeChange";

import Lock from "@iconify-icons/ri/lock-fill";
import User from "@iconify-icons/ri/user-3-fill";
import regist from "./components/regist.vue";
import update from "./components/update.vue";
const currentPage = computed(() => {
  return useUserStoreHook().currentPage;
});
defineOptions({
  name: "Login"
});
const router = useRouter();
const loading = ref(false);
const ruleFormRef = ref<FormInstance>();
const loginDay = ref(7);
const { initStorage } = useLayout();
initStorage();

const { dataThemeChange } = useDataThemeChange();
dataThemeChange();
const { title } = useNav();
const checked = ref(false);
const ruleForm = reactive({
  username: "",
  password: ""
});
const onLogin = async (formEl: FormInstance | undefined) => {
  loading.value = true;
  if (!formEl) return;
  await formEl.validate((valid, fields) => {
    if (valid) {
      useUserStoreHook()
        .loginByUsername({
          username: ruleForm.username,
          password: ruleForm.password
        })
        .then(res => {
          if (res.success) {
            // 获取后端路由
            initRouter().then(() => {
              router.push(getTopMenu(true).path);
              message("登录成功", { type: "success" });
            });
          } else {
            message("账号或密码错误，登陆失败", { type: "error" });
            loading.value = false;
          }
        });
    } else {
      loading.value = false;
      return fields;
    }
  });
};

/** 使用公共函数，避免`removeEventListener`失效 */
function onkeypress({ code }: KeyboardEvent) {
  if (code === "Enter") {
    onLogin(ruleFormRef.value);
  }
}

onMounted(() => {
  window.document.addEventListener("keypress", onkeypress);
});

onBeforeUnmount(() => {
  window.document.removeEventListener("keypress", onkeypress);
});
</script>

<template>
  <div class="select-none">
    <div class="login-container">
      <div class="img">
        <component :is="toRaw(illustration)" />
      </div>
      <div class="login-box">
        <div class="login-form" style="margin-bottom: 200px">
          <Motion>
            <div
              style="display: flex; flex-direction: column; align-items: center"
            >
              <component :is="toRaw(book)" />
              <h2 class="outline-none">{{ title }}</h2>
            </div>
          </Motion>

          <el-form
            v-if="currentPage === 0"
            ref="ruleFormRef"
            :model="ruleForm"
            :rules="loginRules"
            size="large"
          >
            <Motion :delay="100">
              <el-form-item
                :rules="[
                  {
                    required: true,
                    message: '请输入账号',
                    trigger: 'blur'
                  }
                ]"
                prop="username"
              >
                <el-input
                  clearable
                  v-model="ruleForm.username"
                  placeholder="账号"
                  :prefix-icon="useRenderIcon(User)"
                />
              </el-form-item>
            </Motion>

            <Motion :delay="150">
              <el-form-item prop="password">
                <el-input
                  clearable
                  show-password
                  v-model="ruleForm.password"
                  placeholder="密码"
                  :prefix-icon="useRenderIcon(Lock)"
                />
              </el-form-item>
            </Motion>

            <Motion :delay="250">
              <div class="w-full h-[20px] flex justify-between items-center">
                <el-checkbox v-model="checked">
                  <span class="flex">
                    <select
                      v-model="loginDay"
                      :style="{
                        width: loginDay < 10 ? '10px' : '16px',
                        outline: 'none',
                        background: 'none',
                        appearance: 'none'
                      }"
                    >
                      <option value="1">1</option>
                      <option value="7">7</option>
                      <option value="30">30</option>
                    </select>
                    天内免登录
                    <el-tooltip
                      effect="dark"
                      placement="top"
                      content="勾选并登录后，规定天数内无需输入用户名和密码会自动登入系统	"
                    >
                      <IconifyIconOffline :icon="Info" class="ml-1" />
                    </el-tooltip>
                  </span>
                </el-checkbox>
                <el-button
                  link
                  type="primary"
                  @click="useUserStoreHook().SET_CURRENTPAGE(4)"
                >
                  忘记密码
                </el-button>
              </div>
              <el-button
                class="w-full mt-4"
                size="default"
                type="primary"
                :loading="loading"
                @click="onLogin(ruleFormRef)"
              >
                登录
              </el-button>
            </Motion>

            <Motion :delay="300">
              <el-form-item style="padding-top: 15px">
                <div class="w-full h-[20px] flex justify-between items-center">
                  <el-button
                    class="w-full mt-4"
                    size="default"
                    @click="useUserStoreHook().SET_CURRENTPAGE(3)"
                  >
                    注册
                  </el-button>
                </div>
              </el-form-item>
            </Motion>
            <!-- 注册 -->
          </el-form>
          <regist v-if="currentPage === 3" />
          <!-- 忘记密码 -->
          <update v-if="currentPage === 4" />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
@import url("@/style/login.css");
</style>

<style lang="scss" scoped>
:deep(.el-input-group__append, .el-input-group__prepend) {
  padding: 0;
}
</style>
