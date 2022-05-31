<template>
  <b-card
    title="Generate Shipping Bag"
  >
    <validation-observer
      #default="{ handleSubmit }"
      ref="refFormObserver"
    >
      <b-form
        @submit.prevent="handleSubmit(onSubmit)"
        @reset.prevent="resetForm"
      >
        <b-row>
          <b-col cols="6">
            <b-row>
              <b-col cols="12">
                <b-form-group
                  label="Dari Tanggal"
                  label-for="h-user-code"
                  label-cols-md="4"
                >
                  <b-form-datepicker
                    v-model="formData.fromDate"
                    locale="id"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="12">
                <validation-provider
                #default="validationContext"
                name="Kode Role"
                rules="required"
              >
                <b-form-group
                  label="Kode Role"
                  label-for="h-role-code"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-role-code"
                    v-model="formData.role_code"
                    :state="getValidationState(validationContext)"
                    placeholder="Kode Role"
                  />
                    <b-form-invalid-feedback>
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
            </b-row>
          </b-col>
        </b-row>
      </b-form>
    </validation-observer>
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
      this.formData = {
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
      };
    },
    onSubmit() {
      const data = {
        date: this.formData.date,
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
