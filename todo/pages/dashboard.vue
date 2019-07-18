<template>
  <section class="container">
    <div>
      <h2>マイページ</h2>
      <div class="tip">
        <p>こんにちわ<b>{{currentUser.username}}</b>さん。<br>タスクを登録して日々のやることを忘れないようにしよう！！</p>
      </div>
    </div>
  </section>
</template>

<script>
  import { mapGetters } from 'vuex'
  export default {
    computed: {
      ...mapGetters({
        currentUser: 'auth/currentUser'
      })
    }
  }
</script>
