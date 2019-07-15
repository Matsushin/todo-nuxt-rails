<template>
  <div class="panel w-544">
    <div
      v-if="$route.query.m"
      style="white-space: pre-line;"
      class="notice error mb-32">
      <p>{{ $route.query.m }}</p>
    </div>
    <h2>ログイン</h2>

    <Errors :errors="errors" />

    <form @submit.prevent="login">
      <div class="mt-24">
        <label>メールアドレス</label>
        <input
          v-model="formData.email"
          type="text"
          placeholder="ログインID" >
      </div>
      <div class="mt-24">
        <label>パスワード</label>
        <input
          v-model="formData.password"
          type="password"
          placeholder="パスワード" >
      </div>
      <div class="text-center mt-48">
        <button
          type="submit"
          class="btn">
          ログイン
        </button>
      </div>
    </form>

    <div class="confirm-checkbox mt-32">
      <input
        id="idSaving_checkbox"
        v-model="idSaving"
        type="checkbox"
        @change="clearStrageId" >
      <label for="idSaving_checkbox">
        メールアドレスを保存する
        (共有パソコンからログインする場合はチェックを外してください)
      </label>

    </div>
  </div>
</template>

<script>
  import Errors from '@/components/shared/Errors'

  export default {
    layout: 'non_registered',
    components: {
      Errors
    },
    asyncData() {
      return {
        formData: {
          email: '',
          password: ''
        },
        errors: []
      }
    },
    data() {
      return {
        maintenanceMessages: [],
        idSaving: true
      }
    },
    mounted() {
      this.getSignInIds()
    },
    methods: {
      getSignInIds() {
        this.formData.email = localStorage.email
      },
      setSignInIds() {
        if (this.idSaving) {
          localStorage.setItem('email', this.formData.email)
        }
      },
      clearStrageId() {
        if (!this.idSaving) {
          localStorage.removeItem('email')
        }
      },
      async login() {
        this.setSignInIds()
        try {
          await this.$store.dispatch('auth/sign_in', { ...this.formData })
          // this.$router.push('/dashboard/')だとlayout/default.vueのmethodsが実行されず
          // sign_inボタンがsign in後のページでも残るのでlocation.replaceを使っています
          location.replace('/dashboard')
        } catch (e) {
          this.errors = []
          if (e.response && e.response.status === 401) {
            this.errors.push(...e.response.data.messages)
          }
        }
      }
    }
  }
</script>
