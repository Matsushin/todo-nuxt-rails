export default function({ $axios, redirect, app }) {
  $axios.onRequest(config => {
    config.headers.common['Authorization'] =
      'Bearer ' + app.$cookies.get('token')

    return config
  })

  $axios.onResponse(response => {
    return response
  })

  $axios.onError(error => {
    const code = parseInt(error.response && error.response.status)
    if (code === 400) {
      redirect('/400')
    }
  })
}
