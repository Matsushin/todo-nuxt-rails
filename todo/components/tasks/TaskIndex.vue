<template>
  <div>
    <el-table
      :data="tasks"
      stripe
      style="width: 100%">
      <el-table-column
        prop="title"
        label="タスク名"
        width="180">
      </el-table-column>
      <el-table-column
        prop="body"
        label="タスク内容"
        width="400">
      </el-table-column>
      <el-table-column
        label="作成日時"
        width="240">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ formattedDate(scope.row.created_at) }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="完了日時"
        width="240">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ formattedDate(scope.row.completed_at) }}</span>
        </template>
      </el-table-column>
      <el-table-column>
        <template slot-scope="scope">
          <el-button
            type="text"
            @click="edit(scope.row.id)"
          >
            編集
          </el-button>
          <el-button
            type="text"
            @click="handleDeleteTask(scope.row.id)"
          >
            削除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
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
    this.fetchTasks()
  },
  methods: {
    formattedDate(str) {
      if (!str) {
        return
      }
      return this.$moment(str).format('YYYY年MM月DD日HH:mm:ss')
    },
    edit(id) {
      this.$router.push({
        name: 'tasks-id-edit',
        params: {
          id: id
        }
      })
    },
    handleDeleteTask(id) {
      if (confirm('タスクを削除しますか？')) {
        this.deleteTask(id)
      }
    },
    async fetchTasks() {
      let res = await this.$axios.$get('/api/v1/tasks')
      this.tasks = res
    },
    async deleteTask(id) {
      const endpoint = '/api/v1/tasks/' + id
      const res = await this.$axios.$delete(endpoint)
      if (res.errors) {
        this.errors = res.errors
      } else {
        this.fetchTasks()
        this.$toast.info('タスクを削除しました。')
      }
    },
  }
}
</script>
