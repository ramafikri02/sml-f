<template>
  <b-card title="Entri Pick up Order">
    <b-alert
      variant="success"
      dismissible
      fade
      show
      class="mb-0"
    >
      <div class="alert-body">
        <span>Data Berhasil Disimpan!</span>
      </div>
    </b-alert>

    <!-- search input -->
    <b-row class="mt-2">
      <b-col
        cols="12"
      >
        <b-form
          @submit.prevent="handleSubmit(onSubmit)"
          @reset.prevent="resetForm"
        >
          <b-col lg="12">
            <b-row>
              <b-col lg="5">
                <b-form-group
                  label="No. Pickup Order"
                  label-for="h-pickup-order"
                  label-cols-md="5"
                >
                  <b-form-input
                    id="h-pickup-no"
                    v-model="formData.pickup_no"
                    readonly
                  />
                </b-form-group>
              </b-col>
              <b-col lg="5">
                <b-button
                  v-ripple.400="'rgba(113, 102, 240, 0.15)'"
                  variant="outline-primary"
                >
                  Ubah
                </b-button>
                <b-button
                  v-ripple.400="'rgba(113, 102, 240, 0.15)'"
                  variant="outline-primary"
                  class="ml-1"
                  @click="toPickupRequest()"
                >
                  Kembali
                </b-button>
              </b-col>
            </b-row>
          </b-col>
        </b-form>
      </b-col>
    </b-row>
  </b-card>
</template>

<script>
import {
  BRow, BCol, BButton, BCard, BFormGroup, BForm, BFormInput, BAlert
} from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import store from '@/store/index'
import Cleave from 'vue-cleave-component'

export default {
  components: {
    BRow,
    BCol,
    BCard,
    BButton,
    BFormGroup,
    BForm,
    BFormInput,
    BAlert,
    Cleave,
  },
  directives: {
    Ripple,
  },
  data() {
    return {
      options: {
        numberOnly: {
          numeral: true,
          numeralThousandsGroupStyle: 'none'
        },
      },

      formData: {
        pickup_no: this.$route.params.id,
      }
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
    toPickupRequest() {
      this.$router.push({ name: 'pickup-request-entry' });
    }
  },
}
</script>

<style lang="scss" >
</style>
