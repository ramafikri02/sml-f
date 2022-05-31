<template>
  <b-card
    title="Laporan Rekap Disbag Manifest"
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
                label="Dari Tanggal"
                label-for="h-user-code"
                label-cols-md="4"
              >
                <b-form-datepicker
                  v-model="formData.fromDate"
                  :max="max"
                  locale="id"
                />
              </b-form-group>
            </b-col>
            <b-col cols="12">
              <b-form-group
                label="Sampai Tanggal"
                label-for="h-user-code"
                label-cols-md="4"
              >
                <b-form-datepicker
                  v-model="formData.untilDate"
                  locale="id"
                />
              </b-form-group>
            </b-col>
            <b-col cols="12">
              <b-form-group
                label="Cabang"
                label-for="h-branch"
                label-cols-md="4"
              >
                <v-select
                  id="h-branch"
                  v-model="formData.branch"
                  :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                  :options="branchOp"
                  label="title"
                  placeholder="Pilih..."
                />
              </b-form-group>
            </b-col>
            <b-col cols="12">
              <b-form-group
                label="Kantor"
                label-for="h-office"
                label-cols-md="4"
              >
                <v-select
                  id="h-office"
                  v-model="formData.office"
                  :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                  :options="officeOp"
                  label="title"
                  placeholder="Pilih..."
                />
              </b-form-group>
            </b-col>
            <b-col cols="12">
              <b-form-group
                label="Cabang Tujuan"
                label-for="h-branch-destination"
                label-cols-md="4"
              >
                <v-select
                  id="h-branch-destination"
                  v-model="formData.branch_destination"
                  :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                  :options="branchOp"
                  label="title"
                  placeholder="Pilih..."
                />
              </b-form-group>
            </b-col>
            <b-col cols="12">
              <b-form-group
                label="Pengguna"
                label-for="h-user"
                label-cols-md="4"
              >
                <v-select
                  id="h-user"
                  v-model="formData.user"
                  :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                  :options="branchOp"
                  label="title"
                  placeholder="Pilih..."
                />
              </b-form-group>
            </b-col>
            <b-col cols="12">
              <b-form-group
                label="Tipe Manifest"
                label-for="h-manifest-type"
                label-cols-md="4"
              >
                <v-select
                  id="h-manifest-type"
                  v-model="formData.manifest_type"
                  :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                  :options="manifestTypeOp"
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
                @click="toPreview()"
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
import manifestTypeOp from '@/@fake-db/data/other/manifestTypeOp'

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
    const now = new Date()
    const today = new Date(now.getFullYear(), now.getMonth(), now.getDate())
    // 15th two months prior
    // const minDate = new Date(today)
    // minDate.setMonth(minDate.getMonth() - 2)
    // minDate.setDate(15)
    // 15th in two months
    const maxDate = new Date(today)
    maxDate.setMonth(maxDate.getMonth())

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
      manifestTypeOp,

      // Form Validation
      ValidationProvider,
      ValidationObserver,

      max: maxDate,

      formData: {
        fromDate: '',
        untilDate: '',
        branch: null,
        branch_destination: null,
        user: '',
      }
    }
  },
  mounted() {
    this.formData.fromDate = new Date()
    this.formData.untilDate = new Date()
  },
  methods: {
    toPreview() {
      let routeData = this.$router.resolve(
      {
        path: '/outgoing/report/disbag-manifest/preview',
      });
      window.open(routeData.href, '_blank');
    },
    getValidationState({ dirty, validated, valid = null }) {
      return dirty || validated ? valid : null;
    },
    onSubmit() {
      const data = {
        fromDate: this.formData.fromDate,
        untilDate: this.formData.untilDate,
        password: this.formData.password,
        branch: this.formData.branch,
        branch_destination: this.formData.branch_destination,
        user: this.formData.user,
      };

      console.log(data)

      // this.$store.dispatch('user/ADD_USER', data).then(() => {
      //   this.$router.push('/masterdata/users')
      //   .then(() => {
      //     this.$toast({
      //       component: ToastificationContent,
      //       position: 'top-right',
      //       props: {
      //         title: `Berhasil tambah pengguna`,
      //         icon: 'ThumbsUpIcon',
      //         variant: 'success',
      //         text: `Anda telah berhasil menambahkan ${data.full_name} sebagai ${data.user_group}!`,
      //       },
      //     })
      //   })
      // });
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
