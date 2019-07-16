<template>
  <div class="new-task-container">
    <Errors :errors="errors"/>

    <h2>タスク新規登録</h2>
    <el-link type="primary">
      <nuxt-link
        to="/tasks"
        class="btn btn-page-back">
        タスク一覧へ戻る
      </nuxt-link>
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
    asyncData() {
      return {
        formData: {},
        errors: []
      }
    },
    computed: {
      ...mapGetters({
        currentUser: 'auth/currentUser'
      })
    },
    methods: {
      async handleSubmit() {
        const params = {
          title: this.formData.title,
          body: this.formData.body
        }
        await this.createtask(params)
      },
      async createtask(params) {
        const endpoint = '/api/v1/tasks'
        const res = await this.$axios.$post(endpoint, params)

        if (res.errors) {
          this.errors = res.errors
        } else {
          this.$router.push('/tasks')
          this.$toast.info('タスクを新規登録しました。')
        }
      }
    }
  }
</script>
