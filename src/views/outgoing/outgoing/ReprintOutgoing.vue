<template>
  <b-card title="Cetak Ulang Disbag Manifest">

    <!-- search input -->
    <b-row>
      <b-col
        cols="12"
      >
        <b-form
          @submit.prevent="handleSubmit(onSubmit)"
          @reset.prevent="resetForm"
        >
          <b-row class="justify-content-center">
            <b-col cols="6">
              <b-form-group
                label="Cari No. Disbag Manifest / Shipping Bag : "
                label-for="h-user-code"
                label-cols-md="5"
              >
                  <b-form-input
                    v-uppercase
                    id="h-user-code"
                    v-model="searchReceipt"
                  />
              </b-form-group>
            </b-col>
            <b-col cols="2">
              <b-button
                v-ripple.400="'rgba(255, 255, 255, 0.15)'"
                type="submit"
                variant="primary"
                class="mr-1"
              >
                Cari
              </b-button>
            </b-col>
          </b-row>
        </b-form>
      </b-col>
    </b-row>
  </b-card>
</template>

<script>
import {
  BRow, BCol, BButton, BCard, BFormGroup, BForm, BFormInput,
} from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'
import { VueGoodTable } from 'vue-good-table'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import store from '@/store/index'

export default {
  components: {
    BRow,
    BCol,
    BCard,
    VueGoodTable,
    BButton,
    BFormGroup,
    BForm,
    BFormInput,
  },
  directives: {
    Ripple,
  },
  data() {
    return {
      searchReceipt: '',
    }
  },
  mounted() {
    
  },
  computed: {
    direction() {
      if (store.state.appConfig.isRTL) {
        // eslint-disable-next-line vue/no-side-effects-in-computed-properties
        this.dir = true
        return this.dir
      }
      // eslint-disable-next-line vue/no-side-effects-in-computed-properties
      this.dir = false
      return this.dir
    },
  },
  methods: {
    
  },
}
</script>

<style lang="scss" >
@import '@core/scss/vue/libs/vue-good-table.scss';
@import '@core/scss/vue/libs/vue-sweetalert.scss';
@import '@assets/scss/custom/vgt-custom.scss';
</style>
