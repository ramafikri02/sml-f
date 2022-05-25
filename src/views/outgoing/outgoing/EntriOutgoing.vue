<template>
  <b-card
    title="Entri Disbag Manifest"
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
              <b-form-group
                label="Tanggal"
                label-for="h-date"
                label-cols-md="4"
              >
                <b-form-datepicker
                  v-model="formData.date"
                  locale="id"
                />
              </b-form-group>
            </b-col>
            <b-col cols="12">
              <validation-provider
                #default="validationContext"
                name="No. Shipping Bag"
                rules="required"
              >
                <b-form-group
                  label="No. Shipping Bag"
                  label-for="h-no-shipping-bag"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-no-shipping-bag"
                    v-model="formData.no_shipping_bag"
                    :state="getValidationState(validationContext)"
                    placeholder="No. Shipping Bag"
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
                name="Nama Role"
                rules="required"
              >
                <b-form-group
                  label="Nama Role"
                  label-for="h-role-name"
                  label-cols-md="4"
                >
                  <b-form-input
                    id="h-role-name"
                    v-model="formData.full_name"
                    :state="getValidationState(validationContext)"
                    placeholder="Nama Role"
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
  BCard, BRow, BCol, BFormGroup, BFormInput, BFormTextarea, BFormInvalidFeedback, BForm, BButton, BFormDatepicker,
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
    BFormInvalidFeedback,
    BForm,
    BButton,
    vSelect,
		BFormDatepicker,	

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
        no_shipping_bag: '',
        manifest_type: null,
        vendor_name: null,
        branch_destination: null,
        office_destination: null,
        transit_branch: null,
        product_type: null,
        nopol: null,
        box_section: null,
        driver: null,
        courier1: null,
        courier2: null,
				early_load_hours: '',
				final_load_hours: '',
				departure_time: '',
				description: '',
				volume: '',
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
        no_shipping_bag: '',
        manifest_type: null,
        vendor_name: null,
        branch_destination: null,
        office_destination: null,
        transit_branch: null,
        product_type: null,
        nopol: null,
        box_section: null,
        driver: null,
        courier1: null,
        courier2: null,
				early_load_hours: '',
				final_load_hours: '',
				departure_time: '',
				description: '',
				volume: '',
      };
    },
    onSubmit() {
      const data = {
        date: this.formData.date,
        no_shipping_bag: this.formData.no_shipping_bag,
        manifest_type: this.formData.manifest_type,
        vendor_name: this.formData.vendor_name,
        branch_destination: this.formData.branch_destination,
        office_destination: this.formData.office_destination,
        transit_branch: this.formData.transit_branch,
        product_type: this.formData.product_type,
        nopol: this.formData.nopol,
        box_section: this.formData.box_section,
        driver: this.formData.driver,
        courier1: this.formData.courier1,
        courier2: this.formData.courier2,
        early_load_hours: this.formData.early_load_hours,
        departure_time: this.formData.departure_time,
        description: this.formData.description,
        volume: this.formData.volume,
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
