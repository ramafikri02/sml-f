<template>
  <b-card
    title="Entri/Ubah Kontrak Pelanggan (Harga Khusus)"
  >
    <b-row>
      <b-col lg="8">
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
                  name="Nomor Kontrak"
                  rules="required"
                >
                  <b-form-group
                    label="Nomor Kontrak"
                    label-for="h-contract-no"
                    label-cols-md="4"
                  >
                    <b-form-input
                      v-uppercase
                      id="h-contract-no"
                      v-model="formData.role_code"
                      :state="getValidationState(validationContext)"
                      placeholder="Nomor Kontrak"
                    />
                    <b-form-invalid-feedback>
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
              <b-col cols="7">
                <b-form-group
                  label="Cabang"
                  label-for="h-branch"
                  label-cols-md="7"
                >
                  <b-form-input
                    v-uppercase
                    id="h-branch"
                    v-model="formData.full_name"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="5">
                <b-form-group
                >
                  <b-form-input
                    v-uppercase
                    id="h-branch"
                    v-model="formData.full_name"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="7">
                <b-form-group
                  label="Pelanggan"
                  label-for="h-branch"
                  label-cols-md="7"
                >
                  <b-form-input
                    v-uppercase
                    id="h-branch"
                    v-model="formData.full_name"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="5">
                <b-form-group
                >
                  <b-form-input
                    v-uppercase
                    id="h-branch"
                    v-model="formData.full_name"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="12">
                <b-form-group
                  label="Tanggal"
                  label-for="h-date"
                  label-cols-md="4"
                >
                  <b-row>
                    <b-col cols="6">
                      <b-form-datepicker
                        id="h-date"
                        v-model="formData.date"
                        :show-decade-nav="true"
                        :hide-header="true"
                        placeholder="Tanggal"
                      />
                    </b-col>
                    <b-col cols="6">
                      <b-form-datepicker
                        id="h-date"
                        v-model="formData.date"
                        :show-decade-nav="true"
                        :hide-header="true"
                        placeholder="Tanggal"
                      />
                    </b-col>
                  </b-row>
                </b-form-group>
              </b-col>
              <b-col cols="12">
                <validation-provider
                  #default="validationContext"
                  name="Deskripsi"
                  rules="required"
                >
                  <b-form-group
                    label="Deskripsi"
                    label-for="h-description"
                    label-cols-md="4"
                  >
                    <b-form-textarea
                      v-uppercase
                      id="h-description"
                      v-model="formData.description"
                      :state="getValidationState(validationContext)"
                      placeholder="Deskripsi"
                    />
                    <b-form-invalid-feedback>
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
                  @click="redirectToUsersList()"
                >
                  Kembali
                </b-button>
              </b-col>
            </b-row>

          </b-form>
        </validation-observer>
      </b-col>
    </b-row>
  </b-card>
</template>

<script>
import {
  BCard, BRow, BCol, BFormGroup, BFormInput, BFormTextarea, BFormDatepicker, BFormInvalidFeedback, BForm, BButton,
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
    BFormTextarea,
    BFormDatepicker,
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

      formData: {
        date: '',
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
    }
  },
  methods: {
    getValidationState({ dirty, validated, valid = null }) {
      return dirty || validated ? valid : null;
    },
    resetForm() {
      this.password_confirm = '',
      this.formData = {
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
      };
    },
    onSubmit() {
      const data = {
        user_code: this.formData.user_code,
        full_name: this.formData.full_name,
        password: this.formData.password,
        branch_code: this.formData.branch_code,
        office_code: this.formData.office_code,
        user_group: this.formData.user_group,
        id_account: this.formData.id_account,
        id_employee: this.formData.id_employee,
        multiple_login: this.formData.multiple_login,
        company_id: this.formData.company_id,
        status: this.formData.status,
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
      this.$router.push({ path: '/masterdata/roles-mapping' })
    },
  },
}
</script>

<style lang="scss">
@import '@core/scss/vue/libs/vue-select.scss';
</style>
