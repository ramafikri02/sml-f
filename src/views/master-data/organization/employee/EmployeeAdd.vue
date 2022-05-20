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
                name="Kode Departemen"
                rules="required"
              >
                <b-form-group
                  label="Kode Departemen"
                  label-for="h-department-code"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-department-code"
                    v-model="formData.department_code"
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
                name="Manager"
                rules="required"
              >
                <b-form-group
                  label="Manager"
                  label-for="h-manager"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-manager"
                    v-model="formData.manager"
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
                name="Nama Depan"
                rules="required"
              >
                <b-form-group
                  label="Nama Depan"
                  label-for="h-first-name"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-first-name"
                    v-model="formData.first_name"
                    :state="getValidationState(validationContext)"
                    placeholder="Nama Depan"
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
                name="Nama Tengah"
                rules="required"
              >
                <b-form-group
                  label="Nama Tengah"
                  label-for="h-middle-name"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-middle-name"
                    v-model="formData.middle_name"
                    :state="getValidationState(validationContext)"
                    placeholder="Nama Tengah"
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
                name="Nama Akhir"
                rules="required"
              >
                <b-form-group
                  label="Nama Akhir"
                  label-for="h-last-name"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-last-name"
                    v-model="formData.last_name"
                    :state="getValidationState(validationContext)"
                    placeholder="Nama Akhir"
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
                name="Alamat"
                rules="required"
              >
                <b-form-group
                  label="Alamat"
                  label-for="h-address"
                  label-cols-md="4"
                >
                  <b-form-textarea
                    id="h-address"
                    v-model="formData.address"
                    :state="getValidationState(validationContext)"
                    placeholder="Alamat"
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
                name="Kantor"
                rules="required"
              >
                <b-form-group
                  label="Kantor"
                  label-for="h-office"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-office"
                    v-model="formData.office"
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
                name="Kode Daerah"
                rules="required"
              >
                <b-form-group
                  label="Kode Daerah"
                  label-for="h-area"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-area"
                    v-model="formData.area"
                    :state="getValidationState(validationContext)"
                    placeholder="Kode Daerah"
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
                name="Kode TLC"
                rules="required"
              >
                <b-form-group
                  label="Kode TLC"
                  label-for="h-tlc-code"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-tlc-code"
                    v-model="formData.tlc_code"
                    :state="getValidationState(validationContext)"
                    placeholder="Kode TLC"
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
                name="Tempat Lahir"
                rules="required"
              >
                <b-form-group
                  label="Tempat Lahir"
                  label-for="h-place-of-birth"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-place-of-birth"
                    v-model="formData.place_of_birth"
                    :state="getValidationState(validationContext)"
                    placeholder="Tempat Lahir"
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
                name="Tanggal Lahir"
                rules="required"
              >
                <b-form-group
                  label="Tanggal Lahir"
                  label-for="h-date-of-birth"
                  label-cols-md="4"
                >
                  <b-form-datepicker
                    id="h-date-of-birth"
                    v-model="formData.date_of_birth"
                    :state="getValidationState(validationContext)"
                    :show-decade-nav="true"
                    :hide-header="true"
                    placeholder="Tanggal Lahir"
                    class="mb-1"
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
                name="Jenis Kelamin"
                rules="required"
              >
                <b-form-group
                  label="Jenis Kelamin"
                  label-for="h-gender"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-gender"
                    v-model="formData.gender"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="genderOp"
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
                name="Kode POS"
                rules="required"
              >
                <b-form-group
                  label="Kode POS"
                  label-for="h-postal-code"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-postal-code"
                    v-model="formData.postal_code"
                    :state="getValidationState(validationContext)"
                    placeholder="Kode POS"
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
                name="Status Pernikahan"
                rules="required"
              >
                <b-form-group
                  label="Status Pernikahan"
                  label-for="h-marital-status"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-marital-status"
                    v-model="formData.marital_status"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="maritalOp"
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
                name="Tanggungan"
                rules="required"
              >
                <b-form-group
                  label="Tanggungan"
                  label-for="h-dependents"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-dependents"
                    v-model="formData.dependents"
                    :state="getValidationState(validationContext)"
                    placeholder="Tanggungan"
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
                name="Pendidikan Terakhir"
                rules="required"
              >
                <b-form-group
                  label="Pendidikan Terakhir"
                  label-for="h-last-education"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-last-education"
                    v-model="formData.last_education"
                    :state="getValidationState(validationContext)"
                    placeholder="Pendidikan Terakhir"
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
                name="Status Karyawan"
                rules="required"
              >
                <b-form-group
                  label="Status Karyawan"
                  label-for="h-employee-status"
                  label-cols-md="4"
                  :state="getValidationState(validationContext)"
                >
                  <v-select
                    id="h-employee-status"
                    v-model="formData.employee_status"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="employeeStatusOp"
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
                name="Deskripsi"
                rules="required"
              >
                <b-form-group
                  label="Deskripsi"
                  label-for="h-description"
                  label-cols-md="4"
                >
                  <b-form-textarea
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
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="Nama Istri"
                rules="required"
              >
                <b-form-group
                  label="Nama Istri"
                  label-for="h-wife-name"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-wife-name"
                    v-model="formData.wife_name"
                    :state="getValidationState(validationContext)"
                    placeholder="Nama Istri"
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
                name="Nama Anak"
                rules="required"
              >
                <b-form-group
                  label="Nama Anak"
                  label-for="h-child-name"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-child-name"
                    v-model="formData.child_name"
                    :state="getValidationState(validationContext)"
                    placeholder="Nama Anak"
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
                name="Email"
                rules="required"
              >
                <b-form-group
                  label="Email"
                  label-for="h-email"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-email"
                    type="email"
                    v-model="formData.email"
                    :state="getValidationState(validationContext)"
                    placeholder="Email"
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
                    :options="statusOp"
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
                @click="redirectToEmployeeList()"
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
  BCard, BRow, BCol, BFormGroup, BFormInput, BFormTextarea, BFormDatepicker, BInputGroupPrepend, BInputGroup, BFormInvalidFeedback, BForm, BButton,
} from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required, alphaNum } from '@validations'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import Cleave from 'vue-cleave-component'
import 'cleave.js/dist/addons/cleave-phone.id'
import branch from '@/@fake-db/data/other/branch'
import office from '@/@fake-db/data/other/office'
import companyId from '@/@fake-db/data/other/companyId'
import idAccount from '@/@fake-db/data/other/idAccount'
import idEmployee from '@/@fake-db/data/other/idEmployee'
import userGroup from '@/@fake-db/data/other/userGroup'
import yesNo from '@/@fake-db/data/other/yesNo'
import statusOp from '@/@fake-db/data/other/statusOp'
import genderOp from '@/@fake-db/data/other/genderOp'
import maritalOp from '@/@fake-db/data/other/maritalOp'
import employeeStatusOp from '@/@fake-db/data/other/employeeStatusOp'

export default {
  components: {
    BCard,
    BRow,
    BCol,
    BFormGroup,
    BFormInput,
    BFormTextarea,
    BFormDatepicker,
    BInputGroupPrepend,
    BInputGroup,
    Cleave,
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
      statusOp,
      genderOp,
      maritalOp,
      employeeStatusOp,

      options: {
        phone_number: {
          phone: true,
          phoneRegionCode: 'ID',
        },
      },

      // Form Validation
      ValidationProvider,
      ValidationObserver,

      formData: {
        employee_code: '',
        job_code: '',
        department_code: null,
        manager: null,
        first_name: '',
        middle_name: '',
        last_name: '',
        address: '',
        branch: null,
        office: null,
        area_code: '',
        tlc_code: '',
        place_of_birth: '',
        date_of_birth: '',
        work_start_date: '',
        gender: null,
        postal_code: '',
        marital_status: null,
        dependents: null,
        last_education: '',
        employee_status: null,
        description: '',
        wife_name: '',
        child_name: '',
        phone_number: '',
        email: '',
        status: null,
        photo: '',
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
        employee_code: '',
        job_code: '',
        department_code: null,
        manager: null,
        first_name: '',
        middle_name: '',
        last_name: '',
        address: '',
        branch: null,
        office: null,
        area_code: '',
        tlc_code: '',
        place_of_birth: '',
        date_of_birth: '',
        work_start_date: '',
        gender: null,
        postal_code: '',
        marital_status: null,
        dependents: null,
        last_education: '',
        employee_status: null,
        description: '',
        wife_name: '',
        child_name: '',
        phone_number: '',
        email: '',
        status: null,
        photo: '',
      };
    },
    onSubmit() {
      const data = {
        employee_code: this.formData.employee_code,
        job_code: this.formData.job_code,
        department_code: this.formData.department_code,
        manager: this.formData.manager,
        first_name: this.formData.first_name,
        middle_name: this.formData.middle_name,
        last_name: this.formData.last_name,
        address: this.formData.address,
        branch: this.formData.branch,
        office: this.formData.office,
        area_code: this.formData.area_code,
        tlc_code: this.formData.tlc_code,
        place_of_birth: this.formData.place_of_birth,
        date_of_birth: this.formData.date_of_birth,
        work_start_date: this.formData.work_start_date,
        gender: this.formData.gender,
        postal_code: this.formData.postal_code,
        marital_status: this.formData.marital_status,
        dependents: this.formData.dependents,
        last_education: this.formData.last_education,
        employee_status: this.formData.employee_status,
        description: this.formData.description,
        wife_name: this.formData.wife_name,
        child_name: this.formData.child_name,
        phone_number: this.formData.phone_number,
        email: this.formData.email,
        status: this.formData.status,
        photo: this.formData.photo,
      };

      console.log(data)

      this.$store.dispatch('branch/ADD_BRANCH', data).then(() => {
        this.$router.push('/masterdata/employees')
        .then(() => {
          this.$toast({
            component: ToastificationContent,
            position: 'top-right',
            props: {
              title: `Berhasil tambah cabang`,
              icon: 'ThumbsUpIcon',
              variant: 'success',
              text: `Anda telah berhasil menambahkan ${data.first_name} ${data.middle_name} ${data.last_name} pada departemen ${data.department_code}!`,
            },
          })
        })
      });
    },
    redirectToEmployeeList() {
      this.$router.push({ path: '/masterdata/employees' })
    },
  },
}
</script>

<style lang="scss">
@import '@core/scss/vue/libs/vue-select.scss';
</style>
