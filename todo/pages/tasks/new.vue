<template>
  <div class="main-contents">
    <div class="contents-servey-create">
      <Errors :errors="errors"/>

      <h1>アンケート新規登録</h1>
      <div class="button-page-back-wrapper">
        <router-link
          to="/tasks"
          class="btn btn-page-back">
          アンケート一覧へ戻る
        </router-link>
      </div>

      <form @submit.prevent="handleSubmit">
        <div class="box-wrapper">
          <div class="box">
            <h2 class="contract-date">
              <span>契約終了日：</span>
              {{ ymd(currentUser.organization.contract_end_at) }}
            </h2>

            <div class="panel panel-input-list">
              <ul class="input-list">
                <li>
                  <label>
                    アンケート名
                  </label>
                  <input
                    v-model="formData.name"
                    type="text"
                    placeholder="営業部 2019年 2月上旬 - 3月下旬"
                    required
                    class="task-name"
                  >
                </li>
                <li>
                  <label>
                    回答開始日
                  </label>
                  <el-date-picker
                    ref="scheduledAtDay"
                    :picker-options="datePickerOptions"
                    v-model="formData.start_at"
                    :required="true"
                    type="date"
                    value-format="yyyy-MM-dd"
                    format="yyyy-MM-dd"/>
                </li>
                <li>
                  <label>
                    回答終了日
                  </label>
                  <el-date-picker
                    ref="scheduledAtDay"
                    :picker-options="datePickerOptions"
                    v-model="formData.end_at"
                    :required="true"
                    type="date"
                    value-format="yyyy-MM-dd"
                    format="yyyy-MM-dd"/>
                </li>
              </ul>
            </div>
          </div>
        </div>

        <div class="text-center mt-32">
          <submit-button
            type="submit"
            class="btn">
            この内容で登録する
          </submit-button>
        </div>
      </form>

    </div>
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
        datePickerOptions: {
          disabledDate(date) {
            let now = new Date()
            now.setHours(0, 0, 0, 0)
            return date <= now
          }
        },
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
          name: this.formData.name,
          start_at: this.formData.start_at,
          end_at: this.formData.end_at
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
