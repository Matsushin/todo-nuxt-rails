<template>
  <div>
    <h2>タスク一覧</h2>
    <el-link type="primary">
      <nuxt-link
        to="/tasks/new"
        class="btn btn-create">
        タスク新規登録
      </nuxt-link>
    </el-link>
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
