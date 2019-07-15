<template>
  <div class="box">
    <el-table
      :data="tasks"
      stripe
      style="width:100%">
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
        prop="completed_at"
        label="完了日時"
        width="240">
      </el-table-column>
      <el-table-column
        width="120"
        >
        <template slot-scope="scope">
          <el-button @click="handleClick" type="text">詳細</el-button>
          <el-button type="text">編集</el-button>
          <el-button type="text">
            <router-link
              :to="{ name: 'tasks-id', params: { id: scope.row.id.toString() }}"
              class="btn btn-task-list-link">
              詳細設定
            </router-link>
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
    this.fetchtasks()
  },
  methods: {
    formattedDate(str) {
      return this.$moment(str).format('YYYY年MM月DD日HH:mm:ss')
    },
    handleClick() {
      console.log('click')
    },
    async fetchtasks() {
      let res = await this.$axios.$get('/api/v1/tasks')
      this.tasks = res
    }
  }
}
</script>
