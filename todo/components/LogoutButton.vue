<template>
  <submit-button
    class="btn btn-logout"
    @click="logout">ログアウト</submit-button>
</template>

<script>
  export default {
    methods: {
      async logout() {
        try {
          this.$cookies.remove('token')
          // this.$router.push('/')だとlayout/default.vueのmethodsが実行されず
          // logoutボタンがsign inページでも残るのでlocation.replaceを使っています
          location.replace('/sign_in')
        } catch (e) {
          console.log(e)
        }
      }
    }
  }
</script>
