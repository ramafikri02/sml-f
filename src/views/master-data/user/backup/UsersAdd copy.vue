<template>
  <b-card
    title="Tambah Pengguna"
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
                name="Kode Pengguna"
                rules="required"
              >
                <b-form-group
                  label="Kode Pengguna"
                  label-for="h-user-code"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-user-code"
                    v-model="userData.user_code"
                    autofocus
                    :state="getValidationState(validationContext)"
                    placeholder="Kode Pengguna"
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
                name="Nama Pengguna"
                rules="required"
              >
                <b-form-group
                  label="Nama Pengguna"
                  label-for="h-full-name"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-full-name"
                    v-model="userData.full_name"
                    :state="getValidationState(validationContext)"
                    placeholder="Nama Pengguna"
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
                    v-model="userData.password"
                    :state="getValidationState(validationContext)"
                    type="password"
                    placeholder="Kata Sandi"
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
                name="Cabang Pengguna"
                rules="required"
              >
                <b-form-group
                  label="Cabang Pengguna"
                  label-for="h-branch_code"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-branch_code"
                    v-model="userData.branch_code"
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
                name="Kantor Pengguna"
                rules="required"
              >
                <b-form-group
                  label="Kantor Pengguna"
                  label-for="h-office-code"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-office-code"
                    v-model="userData.branch_office"
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
                name="ID Akun"
                rules="required"
              >
                <b-form-group
                  label="ID Akun"
                  label-for="h-id-account"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-id-account"
                    v-model="userData.id_account"
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
                name="ID Pegawai"
                rules="required"
              >
                <b-form-group
                  label="ID Pegawai"
                  label-for="h-id-employee"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-id-employee"
                    v-model="userData.id_employee"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="idEmployee"
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
                name="Grup Pengguna"
                rules="required"
              >
                <b-form-group
                  label="Grup Pengguna"
                  label-for="h-user-group"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-user-group"
                    v-model="userData.user_group"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="userGroup"
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
                name="Multiple Login"
                rules="required"
              >
                <b-form-group
                  label="Multiple Login"
                  label-for="h-multiple-login"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-multiple-login"
                    v-model="userData.multiple_login"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="yesNo"
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
                name="Company ID"
                rules="required"
              >
                <b-form-group
                  label="Company ID"
                  label-for="h-company-id"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-company-id"
                    v-model="userData.company_id"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="companyId"
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
                @click="redirectToUsersList()"
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
import formValidation from '@core/comp-functions/forms/form-validation'
import { ref } from '@vue/composition-api'
import { required, alphaNum } from '@validations'
import store from '@/store'
import branch from '@/@fake-db/data/other/branch'
import office from '@/@fake-db/data/other/office'
import companyId from '@/@fake-db/data/other/companyId'
import idAccount from '@/@fake-db/data/other/idAccount'
import idEmployee from '@/@fake-db/data/other/idEmployee'
import userGroup from '@/@fake-db/data/other/userGroup'
import yesNo from '@/@fake-db/data/other/yesNo'

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
      password_confirm: '',
    }
  },
  setup(props, { emit }) {
    const blankUserData = {
      user_code: '',
      full_name: '',
      password: '',
      branch_code: null,
      office_code: null,
      user_group: null,
      id_account: null,
      id_employee: null,
      multiple_login: null,
      company_id: null,
      status: 'Aktif',
    }

    const userData = ref(JSON.parse(JSON.stringify(blankUserData)))
    const resetuserData = () => {
      userData.value = JSON.parse(JSON.stringify(blankUserData))
    }

    const onSubmit = () => {
      console.log('Payload ', userData.value)
      store.dispatch('user/ADD_USER', userData.value).then(() => {
        this.$router.push({ path: '/masterdata/users/list' })
        .then(() => {
          this.$toast({
            component: ToastificationContent,
            position: 'top-right',
            props: {
              title: `Berhasil tambah pengguna`,
              icon: 'CoffeeIcon',
              variant: 'success',
              text: `Anda telah berhasil menambahkan ${userData.value.full_name} sebagai ${userData.value.user_group}!`,
            },
          })
        })
      });
    }

    const {
      refFormObserver,
      getValidationState,
      resetForm,
    } = formValidation(resetuserData)

    return {
      userData,
      onSubmit,

      refFormObserver,
      getValidationState,
      resetForm,
    }
  },
  methods: {
    redirectToUsersList() {
      this.$router.push({ path: '/masterdata/users/list' })
    },
  },
}
</script>

<style lang="scss">
@import '@core/scss/vue/libs/vue-select.scss';
</style>
