<template>
  <div class="box">
    <table class="task-list">
      <thead>
      <tr>
        <th>タスク名</th>
        <th>タスク内容</th>
        <th>作成日時</th>
        <th>完了日時</th>
        <th>&nbsp;</th>
      </tr>
      </thead>
      <tbody>
      <tr
        v-for="task in tasks"
        :key="task.id">

        <td>
          {{ task.title }}
        </td>
        <td>
          {{ task.body }}
        </td>
        <td class="date">
            <span class="end_at">
              {{ formattedDate(task.created_at) }}
            </span>
        </td>
        <td class="date">
          {{ formattedDate(task.completed_at) }}
        </td>
        <td class="action link">
          <router-link
            :to="{ name: 'hr-tasks-id', params: { id: task.id.toString() }}"
            class="btn btn-task-list-link">
            詳細設定
          </router-link>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'

export default {
  data() {
    return {
      tasks: []
    }
  },
  created() {
    this.fetchtasks()
  },
  methods: {
    formattedDate(str) {
      return this.$moment(str).format('YYYY年MM月DD日')
    },
    async fetchtasks() {
      let res = await this.$axios.$get('/api/v1/tasks')
      this.tasks = res
    }
  }
}
</script>
