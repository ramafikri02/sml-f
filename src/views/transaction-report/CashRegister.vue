<template>
  <b-card
    title="Laporan Penyetoran Outlet"
  >
    <b-col lg="6">
      <validation-observer
        #default="{ handleSubmit }"
        ref="refFormObserver"
      >
        <b-form
          @submit.prevent="handleSubmit(onSubmit)"
        >
          <b-row>
            <b-col cols="12">
              <b-form-group
                label="No. DP3 Outgoing"
                label-for="h-no-outgoing"
                label-cols-md="4"
              >
                <b-form-input
                  v-uppercase
                  id="h-no-outgoing"
                  v-model="formData.no_outgoing"
                  placeholder="No. DP3 Outgoing"
                />
              </b-form-group>
            </b-col>
            <b-col cols="12">
              <b-form-group
                label="Cabang"
                label-for="h-location"
                label-cols-md="4"
              >
                <v-select
                  id="h-location"
                  v-model="formData.location"
                  :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                  :options="branchOp"
                  label="title"
                  placeholder="Pilih..."
                />
              </b-form-group>
            </b-col>

            <!-- submit and reset -->
            <b-col offset-md="4">
              <b-button
                v-ripple.400="'rgba(255, 255, 255, 0.15)'"
                type="submit"
                variant="primary"
                class="mr-1"
              >
                Preview
              </b-button>
            </b-col>
          </b-row>

        </b-form>
      </validation-observer>
    </b-col>
  </b-card>
</template>

<script>
import {
  BCard, BRow, BCol, BFormGroup, BFormInput, BFormInvalidFeedback, BForm, BButton, BFormDatepicker,
} from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required, alphaNum } from '@validations'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import branchOp from '@/@fake-db/data/other/branch'
import officeOp from '@/@fake-db/data/other/office'
import companyId from '@/@fake-db/data/other/companyId'
import idAccount from '@/@fake-db/data/other/idAccount'
import idEmployee from '@/@fake-db/data/other/idEmployee'
import userGroup from '@/@fake-db/data/other/userGroup'
import yesNo from '@/@fake-db/data/other/yesNo'

export default {
  components: {
    BCard,
    BRow,
    BCol,
    BFormGroup,
    BFormInput,
    BFormInvalidFeedback,
    BForm,
    BButton,
    BFormDatepicker,
    vSelect,

    // Form Validation
    ValidationProvider,
    ValidationObserver,
  },
  directives: {
    Ripple,
  },
  data() {
    return {
      required,
      alphaNum,
      branchOp,
      officeOp,
      companyId,
      idAccount,
      idEmployee,
      userGroup,
      yesNo,

      // Form Validation
      ValidationProvider,
      ValidationObserver,

      formData: {
        no_outgoing: '',
        location: null,
      }
    }
  },
  methods: {
    getValidationState({ dirty, validated, valid = null }) {
      return dirty || validated ? valid : null;
    },
    onSubmit() {
      const data = {
        no_outgoing: this.formData.no_outgoing,
        location: this.formData.location,
      };

      console.log(data)

      this.$store.dispatch('user/ADD_USER', data).then(() => {
        this.$router.push('/masterdata/users')
        .then(() => {
          this.$toast({
            component: ToastificationContent,
            position: 'top-right',
            props: {
              title: `Berhasil tambah pengguna`,
              icon: 'ThumbsUpIcon',
              variant: 'success',
              text: `Anda telah berhasil menambahkan ${data.full_name} sebagai ${data.user_group}!`,
            },
          })
        })
      });
    },
    redirectToUsersList() {
      this.$router.push({ path: '/masterdata/users' })
    },
  },
}
</script>

<style lang="scss">
@import '@core/scss/vue/libs/vue-select.scss';
</style>
