<template>
  <button
    :disabled="disabledInternal"
    @click="handleClick"
  >
    <slot/>
  </button>
</template>

<script>
  export default {
    name: 'SubmitButton',
    props: {
      disabled: {
        type: Boolean,
        default: false
      }
    },
    data: function() {
      return {
        disabledInternal: this.disabled
      }
    },
    methods: {
      handleClick(event) {
        if (this.disabledInternal) return

        this.disabledInternal = true

        this.$emit('click', event)

        setTimeout(() => {
          this.disabledInternal = this.disabled
        }, 1000)
      }
    }
  }
</script>
