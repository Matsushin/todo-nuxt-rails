<template>
  <div class="edit-task-container">
    <Errors :errors="errors"/>
    <h2>タスク編集</h2>
    <el-link type="primary" href="/tasks">
      タスク一覧へ戻る
    </el-link>
    <form @submit.prevent="handleSubmit" class="el-form">
      <div class="box-wrapper">
        <div class="box">
          <div class="panel panel-input-list">
            <label class="el-form-item__label">タイトル</label>
            <el-input
              v-model="formData.title"
              type="text"
              required
              class="task-title"
              placeholder="ここにタスクのタイトルが入ります" />
            <label class="el-form-item__label">本文</label>
            <el-input
              v-model="formData.body"
              type="textarea"
              required
              class="task-body"
              placeholder="ここにタスク内容が入ります" />
          </div>
        </div>
      </div>

      <div class="mt-8">
        <el-button
          type="primary"
          native-type="submit"
        >
          この内容で登録する
        </el-button>
      </div>
    </form>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'
  import Errors from '@/components/shared/Errors'

export default {
  components: {
    Errors
  },
  data() {
    return {
      formData: {},
      errors: []
    }
  },
  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser',
      task: 'tasks/task'
    })
  },
  created() {
    this.formData = { ...this.task }
  },
  async fetch({ store, params, redirect }) {
    await store.dispatch('tasks/fetchTask', params.id)
  },
  methods: {
    async handleSubmit() {
      const params = {
        title: this.formData.title,
        body: this.formData.body
      }
      await this.updateTask(this.task, params)
    },
    async updateTask(task, params) {
      const endpoint = `/api/v1/tasks/${task.id}`
      const res = await this.$axios.$patch(endpoint, params)

      if (res.errors) {
        this.errors = res.errors
      } else {
        this.$store.dispatch('tasks/fetchTask', task.id)
        this.$router.push('/tasks')
        this.$toast.info('タスクを変更しました。')
      }
    },
  }
}
</script>
