<template>
  <b-card
    title="Tambah Cabang"
  >
    <b-col lg="6">
      <validation-observer
        #default="{ handleSubmit }"
        ref="refFormObserver"
      >
        <b-form
          @submit.prevent="handleSubmit(onSubmit)"
          @reset.prevent="resetForm"
        >
          <b-row>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Kode Cabang"
                rules="required"
              >
                <b-form-group
                  label="Kode Cabang"
                  label-for="h-user-code"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-user-code"
                    v-model="formData.branch_code"
                    :state="getValidationState(validationContext)"
                    placeholder="Kode Cabang"
                    v-uppercase
                  />
                  <b-form-invalid-feedback>
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Nama Cabang"
                rules="required"
              >
                <b-form-group
                  label="Nama Cabang"
                  label-for="h-name"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-name"
                    v-model="formData.name"
                    :state="getValidationState(validationContext)"
                    placeholder="Nama Cabang"
                    v-uppercase
                  />
                  <b-form-invalid-feedback>
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Kode Region"
                rules="required"
              >
                <b-form-group
                  label="Kode Region"
                  label-for="h-region-code"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-region-code"
                    v-model="formData.region_code"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="branch"
                    label="title"
                    placeholder="Pilih..."
                  />
                  <b-form-invalid-feedback :state="getValidationState(validationContext)">
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Kode Provinsi"
                rules="required"
              >
                <b-form-group
                  label="Kode Provinsi"
                  label-for="h-province-code"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-province-code"
                    v-model="formData.province_code"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="office"
                    label="title"
                    placeholder="Pilih..."
                  />
                  <b-form-invalid-feedback :state="getValidationState(validationContext)">
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Kode IATA"
                rules="required"
              >
                <b-form-group
                  label="Kode IATA"
                  label-for="h-iata-code"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                  v-uppercase
                >
                  <v-select
                    id="h-iata-code"
                    v-model="formData.iata_code"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="office"
                    label="title"
                    placeholder="Pilih..."
                  />
                  <b-form-invalid-feedback :state="getValidationState(validationContext)">
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Jenis Cabang"
                rules="required"
              >
                <b-form-group
                  label="Jenis Cabang"
                  label-for="h-branch-type"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-branch-type"
                    v-model="formData.branch_type"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="idAccount"
                    label="title"
                    placeholder="Pilih..."
                  />
                  <b-form-invalid-feedback :state="getValidationState(validationContext)">
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>

            <!-- submit and reset -->
            <b-col offset-md="4">
              <b-button
                v-ripple.400="'rgba(255, 255, 255, 0.15)'"
                type="submit"
                variant="primary"
                class="mr-1"
              >
                Submit
              </b-button>
              <b-button
                v-ripple.400="'rgba(186, 191, 199, 0.15)'"
                type="reset"
                variant="danger"
                class="mr-1"
              >
                Reset
              </b-button>
              <b-button
                v-ripple.400="'rgba(186, 191, 199, 0.15)'"
                type="reset"
                variant="warning"
                class="mt-1"
                @click="redirectToBranchList()"
              >
                Kembali
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
  BCard, BRow, BCol, BFormGroup, BFormInput, BFormInvalidFeedback, BForm, BButton,
} from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required, alphaNum } from '@validations'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import branch from '@/@fake-db/data/other/branch'
import office from '@/@fake-db/data/other/office'
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
      branch,
      office,
      companyId,
      idAccount,
      idEmployee,
      userGroup,
      yesNo,

      // Form Validation
      ValidationProvider,
      ValidationObserver,

      formData: {
        branch_code: '',
        name: '',
        password: '',
        region_code: null,
        province_code: null,
        iata_code: null,
        branch_type: null,
      }
    }
  },
  methods: {
    getValidationState({ dirty, validated, valid = null }) {
      return dirty || validated ? valid : null;
    },
    resetForm() {
      this.password_confirm = '',
      this.formData = {
        branch_code: '',
        name: '',
        region_code: null,
        province_code: null,
        iata_code: null,
        branch_type: null,
      };
    },
    onSubmit() {
      const data = {
        branch_code: this.formData.branch_code,
        name: this.formData.name,
        region_code: this.formData.region_code,
        province_code: this.formData.province_code,
        iata_code: this.formData.iata_code,
        branch_type: this.formData.branch_type,
      };

      console.log(data)

      this.$store.dispatch('branch/ADD_BRANCH', data).then(() => {
        this.$router.push('/masterdata/branch')
        .then(() => {
          this.$toast({
            component: ToastificationContent,
            position: 'top-right',
            props: {
              title: `Berhasil tambah cabang`,
              icon: 'ThumbsUpIcon',
              variant: 'success',
              text: `Anda telah berhasil menambahkan ${data.name} di Provinsi ${data.province_code}!`,
            },
          })
        })
      });
    },
    redirectToBranchList() {
      this.$router.push({ path: '/masterdata/branch' })
    },
  },
}
</script>

<style lang="scss">
@import '@core/scss/vue/libs/vue-select.scss';
</style>
