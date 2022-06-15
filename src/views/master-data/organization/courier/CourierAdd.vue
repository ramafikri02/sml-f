<template>
  <b-card
    title="Tambah Kurir"
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
                name="Kode Kurir"
                rules="required"
              >
                <b-form-group
                  label="Kode Kurir"
                  label-for="h-user-code"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-user-code"
                    v-model="formData.courier_code"
                    :state="getValidationState(validationContext)"
                    placeholder="Kode Kurir"
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
                name="Kata Sandi"
                rules="required|password:@confirm"
              >
                <b-form-group
                  label="Kata Sandi"
                  label-for="h-password"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-password"
                    v-model="formData.password"
                    :state="getValidationState(validationContext)"
                    type="password"
                    placeholder="Kata Sandi"
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
                name="confirm"
                rules="required"
              >
                <b-form-group
                  label="Konfirmasi Kata Sandi"
                  label-for="h-password2"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-password2"
                    v-model="password_confirm"
                    :state="getValidationState(validationContext)"
                    type="password"
                    placeholder="Kata Sandi"
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
                name="Nama Kurir"
                rules="required"
              >
                <b-form-group
                  label="Nama Kurir"
                  label-for="h-name"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-name"
                    v-model="formData.name"
                    :state="getValidationState(validationContext)"
                    placeholder="Nama Kurir"
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
                name="No Telepon"
                rules="required"
              >
                <b-form-group
                  label="No Telepon"
                  label-for="h-phone-number"
                  label-cols-md="4"
                >
                  <b-input-group>
                  <b-input-group-prepend is-text>
                    ID (+62)
                  </b-input-group-prepend>
                  <cleave
                    id="h-phone-number"
                    v-model="formData.phone_number"
                    class="form-control"
                    :raw="false"
                    placeholder="8xxx xxx xxxx"
                  />
                </b-input-group>
                  <b-form-invalid-feedback>
                    {{ validationContext.errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Cabang"
                rules="required"
              >
                <b-form-group
                  label="Cabang"
                  label-for="h-branch"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-branch"
                    v-model="formData.branch"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="branchOp"
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
                name="Area"
                rules="required"
              >
                <b-form-group
                  label="Area"
                  label-for="h-area-code"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-area-code"
                    v-model="formData.area"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="officeOp"
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
                name="Tugas"
                rules="required"
              >
                <b-form-group
                  label="Tugas"
                  label-for="h-duty"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-duty"
                    v-model="formData.duty"
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
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Kendaraan"
                rules="required"
              >
                <b-form-group
                  label="Kendaraan"
                  label-for="h-vehicle"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-vehicle"
                    v-model="formData.vehicle"
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
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Status"
                rules="required"
              >
                <b-form-group
                  label="Status"
                  label-for="h-status"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-status"
                    v-model="formData.status"
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
                @click="redirectToCourierList()"
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
  BCard, BRow, BCol, BFormGroup, BFormInput, BFormInvalidFeedback, BInputGroupPrepend, BInputGroup, BForm, BButton,
} from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required, alphaNum } from '@validations'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import Cleave from 'vue-cleave-component'
import 'cleave.js/dist/addons/cleave-phone.id'
import branchOp from '@/@fake-db/data/other/branch'
import officeOp from '@/@fake-db/data/other/office'
import companyId from '@/@fake-db/data/other/companyId'
import idAccount from '@/@fake-db/data/other/idAccount'
import idEmployee from '@/@fake-db/data/other/idEmployee'
import userGroup from '@/@fake-db/data/other/userGroup'
import yesNo from '@/@fake-db/data/other/yesNo'
import jobOp from '@/@fake-db/data/other/jobOp'

extend('password', {
  params: ['target'],
  validate(value, { target }) {
    // console.log('Value : ', value)
    // console.log('Target : ', target)
    return value === target;
  },
  message: 'Konfirmasi kata sandi tidak cocok'
});

export default {
  components: {
    BCard,
    BRow,
    BCol,
    BFormGroup,
    BFormInput,
    BInputGroupPrepend,
    BInputGroup,
    Cleave,
    BFormInvalidFeedback,
    BForm,
    BButton,
    vSelect,

    options: {
      phone_number: {
        phone: true,
        phoneRegionCode: 'ID',
      },
    },

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
      jobOp,

      // Form Validation
      ValidationProvider,
      ValidationObserver,

      password_confirm: '',

      formData: {
        courier_code: '',
        name: '',
        password: '',
        phone_number: '',
        branch: '',
        office: '',
        area: '',
        duty: null,
        vehicle: null,
        status: null,
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
        courier_code: '',
        password: '',
        name: '',
        phone_number: '',
        branch: '',
        office: '',
        area: '',
        duty: null,
        vehicle: null,
        status: null,
      };
    },
    onSubmit() {
      const data = {
        courier_code: this.formData.courier_code,
        name: this.formData.name,
        phone_number: this.formData.phone_number,
        branch: this.formData.branch,
        office: this.formData.office,
        area: this.formData.area,
        duty: this.formData.duty,
        vehicle: this.formData.vehicle,
        status: this.formData.status,
      };

      console.log(data)

      this.$store.dispatch('courier/ADD_COURIER', data).then(() => {
        this.$router.push('/masterdata/courier')
        .then(() => {
          this.$toast({
            component: ToastificationContent,
            position: 'top-right',
            props: {
              title: `Berhasil tambah cabang`,
              icon: 'ThumbsUpIcon',
              variant: 'success',
              text: `Anda telah berhasil menambahkan ${data.name} di Provinsi ${data.branch}!`,
            },
          })
        })
      });
    },
    redirectToCourierList() {
      this.$router.push({ path: '/masterdata/courier' })
    },
  },
}
</script>

<style lang="scss">
@import '@core/scss/vue/libs/vue-select.scss';
</style>
