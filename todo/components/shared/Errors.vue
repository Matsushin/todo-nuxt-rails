<template>
  <div v-if="errors.length" class="mt-15">
    <el-alert
      title="エラー"
      type="error"
      :closable="false"
      :description="errors.join('。')"
      show-icon>
    </el-alert>
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
