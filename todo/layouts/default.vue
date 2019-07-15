<template>
  <div>
    <section class="el-container">
      <aside class="el-aside">
        <ul class="el-menu">
          <li>aaa</li>
        </ul>
      </aside>
      <section class="el-container is-vertical">
        <header class="el-header">
          <div
            v-if="!hasCookiesToken">
            <div class="header-contents">
              <div class="header-logo">
                <p>Todo Sample</p>
              </div>
              <div
                v-if="$route.name != 'sign_in'"
                class="header-button">
                <router-link to="/sign_in" >ログイン</router-link>
              </div>
            </div>
          </div>
          <div v-else>
            <div class="header-contents">
              <div class="header-main">
                <div class="header-logo">
                  <p>Todo Sample</p>
                </div>
              </div>
              <div class="header-navi">
                <div class="header-username">
                  {{ currentUser.username }}さん
                </div>
                <div class="header-button">
                  <LogoutButton/>
                </div>
              </div>
            </div>
          </div>
        </header>
        <main class="el-main">

          <div
            v-if="currentUser"
            class="main-container main-with-navi">
            <div class="side-navi">
              <ul class="side-menu">
                <li class="side-menu-dashboard">
                  <router-link to="/dashboard">マイページ</router-link>
                </li>
                <li class="side-menu-survey">
                  <router-link to="/tasks">タスク一覧</router-link>
                </li>
              </ul>
            </div>
            <!-- クエリを変えただけのリンクを辿った時に再レンダリング -->
            <nuxt :nuxt-child-key="$route.fullPath" />
          </div>
          <div
            v-else
            class="main-container">
            <nuxt/>
          </div>
        </main>
        <footer class="el-footer">
          <p>@Matsushin</p>
        </footer>
      </section>
    </section>
  </div>
</template>

<style>
.el-header {
  background-color: #B3C0D1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}
</style>

<script>
  import LogoutButton from '~/components/LogoutButton.vue'
  import { mapGetters } from 'vuex'

  export default {
    components: {
      LogoutButton
    },
    computed: {
      ...mapGetters({
        currentUser: 'auth/currentUser'
      }),
      hasCookiesToken: function() {
        return !!this.$cookies.get('token') && !!this.currentUser
      }
    }
  }
</script>
