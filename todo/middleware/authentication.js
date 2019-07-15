export default async ({ app, route, redirect, store }) => {

  function deleteAuthToken() {
    // token が正しくない場合、cookie から削除する
    app.$cookies.remove('token')
  }


  const token = app.$cookies.get('token')
  // token があって sign in へアクセスされたときは dashboard へ
  if (token && route.path == '/sign_in') {
    redirect('/dashboard')
    return
  }

  // cookie に何もなく sign in へ遷移するときは何もしない
  if (!token && route.path == '/sign_in') {
    return
  }

  if (process.server && !token) {
    redirect('/sign_in')
    return
  }

  // リロード時にもcookieに正しいtokenがあれば'auth/currentUser'に常に

  // 正しい値をセットする
  if ((process.server && !store.getters['auth/currentUser']) || '/') {
    try {
      const endpoint = 'api/v1/token_current_user'
      const response = await app.$axios.$get(endpoint)
      const user = response['user']
      if (user == null) {
        deleteAuthToken()

        redirect('/sign_in')
        return
      }
      store.commit('auth/setCurrentUser', { user })
    } catch (e) {
      console.log('middleware/authentication: ', e)
      deleteAuthToken()
      redirect('/sign_in')
      return
    }
  }
}
