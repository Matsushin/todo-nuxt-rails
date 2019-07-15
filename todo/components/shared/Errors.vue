<template>
  <div
    v-if="errors.length"
    class="notice error">
    <h2
      v-if="showLabel"
      class="notice-title">エラー:</h2>
    <ul :class="{ 'notice-inline': !showLabel }">
      <li
        v-for="error in errors"
        :key="error.id">
        {{ error }}
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
    props: {
      errors: {
        type: Array,
        default: () => {}
      },
      showLabel: {
        type: Boolean,
        default: true
      }
    }
  }
</script>
