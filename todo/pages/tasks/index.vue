<template>
  <div>
    <h2>タスク一覧</h2>
    <el-row :gutter="20">
      <el-col :span="6" :offset="20">
        <el-link type="primary">
          <nuxt-link
            to="/tasks/new"
            class="btn btn-create"
          >
            タスク新規登録
          </nuxt-link>
        </el-link>
      </el-col>
    </el-row>
    <div>
      <TaskIndex />
    </div>
  </div>
</template>
<script>
import TaskIndex from '~/components/tasks/TaskIndex'

export default {
  components: {
    TaskIndex
  }
}
</script>
