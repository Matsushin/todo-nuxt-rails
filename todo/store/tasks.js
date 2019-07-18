export const state = () => ({
  task: {}
})

export const actions = {
  async fetchTask({ commit }, id) {
    let res = await this.$axios.$get('/api/v1/tasks/' + id)
    commit('setTask', res)
  }
}

export const getters = {
  task(state) {
    return state.task
  },
}

export const mutations = {
  setTask(state, payload) {
    state.task = payload
  },
}
