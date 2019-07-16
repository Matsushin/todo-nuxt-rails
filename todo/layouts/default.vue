<template>
  <div>
    <section class="el-container">
      <section class="el-container is-vertical">
        <header class="el-header header">
          <div
            v-if="!hasCookiesToken">
            <p>Todo Sample</p>
          </div>
          <div v-else>
            <el-row :gutter="20">
              <el-col :span="6">
                <div class="grid-content">
                  <p>Todo Sample</p>
                </div>
              </el-col>
              <el-col :span="4" :offset="14">
                <div class="grid-content header-login-section">
                  <span class="header-username">
                    {{ currentUser.username }}さん
                  </span>
                  <LogoutButton/>
                </div>
              </el-col>
            </el-row>
          </div>
        </header>
        <section class="el-container">
          <div v-if="currentUser">
            <aside class="el-aside side-nav">
              <ul role="menu" class="el-menu">
                <li
                  role="menuitem"
                  :class="'el-menu-item ' + activeClass('/dashboard')">
                  <router-link to="/dashboard">
                    <i class="el-icon-user"></i>
                    マイページ
                  </router-link>
                </li>
                <li
                  role="menuitem"
                  :class="'el-menu-item ' + activeClass('/tasks')">
                  <router-link to="/tasks">
                    <i class="el-icon-edit"></i>
                    タスク一覧
                  </router-link>
                </li>
              </ul>
            </aside>
          </div>
          <main class="el-main">
            <div v-if="currentUser">
              <!-- クエリを変えただけのリンクを辿った時に再レンダリング -->
              <nuxt :nuxt-child-key="$route.fullPath" />
            </div>
            <div v-else >
              <nuxt/>
            </div>
          </main>
        </section>
      </section>
    </section>
  </div>
</template>

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
    },
    methods: {
      activeClass(path) {
        return this.$route.path.match(path) ? 'active' : ''
      }
    }
  }
</script>
