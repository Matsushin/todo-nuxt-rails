<template>
  <div>
    <div>
      <h1>タスク一覧</h1>

      <nuxt-link
        to="/tasks/new"
        class="btn btn-create">
        タスク新規登録
      </nuxt-link>
    </div>
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
