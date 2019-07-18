<template>
  <div>
    <h2>タスク一覧</h2>
    <el-link type="primary" href="/tasks/new">
      タスク新規登録
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
