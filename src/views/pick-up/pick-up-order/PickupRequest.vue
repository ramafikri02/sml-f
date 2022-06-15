<template>
  <b-card
    title="Entri Pick up Order"
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
          <b-col lg="12">
            <b-row>
              <b-col cols="5">
                <b-form-group
                  label="Cabang Asal"
                  label-for="h-contract-no"
                  label-cols-md="5"
                >
                  <b-form-input
                    id="h-user-code"
                    v-model="formData.pickup_branch_code"
                    readonly
                  />
                </b-form-group>
              </b-col>
              <b-col cols="4">
                <b-form-group>
                  <b-form-input
                  id="h-user-code"
                  v-model="formData.pickup_branch_name"
                  readonly
                />
                </b-form-group>
              </b-col>
            </b-row>
          </b-col>
          <b-col lg="12">
            <b-row>
              <b-col cols="5">
                <b-form-group
                  label="Kantor Asal"
                  label-for="h-contract-no"
                  label-cols-md="5"
                >
                  <b-form-input
                    id="h-user-code"
                    v-model="formData.pickup_office_code"
                    readonly
                  />
                </b-form-group>
              </b-col>
              <b-col cols="4">
                <b-form-group>
                  <b-form-input
                  id="h-user-code"
                  v-model="formData.pickup_office_name"
                  readonly
                />
                </b-form-group>
              </b-col>
            </b-row>
          </b-col>
          <b-col lg="12">
            <b-row>
              <b-col cols="5">
                <b-form-group
                  label="Tangal"
                  label-for="h-contract-no"
                  label-cols-md="5"
                >
                  <b-form-datepicker
                    locale="id"
                    id="h-date-of-birth"
                    v-model="formData.pickup_sysdate"
                    :show-decade-nav="true"
                    :hide-header="true"
                    placeholder="Tanggal"
                    readonly
                  />
                </b-form-group>
              </b-col>
            </b-row>
          </b-col>
          <b-col lg="12">
            <b-row>
              <b-col cols="5">
                <b-form-group
                  label="Jenis Pembayaran"
                  label-for="h-contract-no"
                  label-cols-md="5"
                >
                  <v-select
                    id="h-province-code"
                    v-model="formData.pickup_payment"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="paymentMethod"
                    :clearable="false"
                    label="title"
                    placeholder="Pilih..."
                  />
                </b-form-group>
              </b-col>
            </b-row>
          </b-col>
          <b-col lg="12">
            <b-row>
              <b-col cols="5">
                <b-form-group
                  :label="'Cari Pelanggan ' + formData.pickup_payment "
                  label-for="h-contract-no"
                  label-cols-md="5"
                >
                  <v-select
                    id="h-province-code"
                    v-model="formData.pickup_account"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="paymentMethod"
                    label="title"
                    placeholder="Pilih..."
                  />
                </b-form-group>
              </b-col>
            </b-row>
          </b-col>
          <b-col cols="11">
            <b-row>
              <b-col cols="9">
                <validation-provider
                  #default="validationContext"
                  name="Alamat Pick up"
                  rules="required"
                >
                  <b-form-group
                    label="Alamat Pick up"
                    label-for="h-pickup-address"
                    label-cols-md="3"
                  >
                    <b-form-textarea
                      id="h-pickup-address"
                      v-model="formData.pickup_address"
                      :state="getValidationState(validationContext)"
                      placeholder="Alamat Pick up"
                    />
                    <b-form-invalid-feedback>
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
            </b-row>
          </b-col>
          <b-col cols="11">
            <b-row>
              <b-col cols="9">
                <validation-provider
                  #default="validationContext"
                  name="Kontak"
                  rules="required"
                >
                  <b-form-group
                    label="Kontak"
                    label-for="h-contact"
                    label-cols-md="3"
                  >
                    <b-form-input
                      id="h-contact"
                      v-model="formData.pickup_contact1"
                      :state="getValidationState(validationContext)"
                      placeholder="Kontak"
                    />
                    <b-form-invalid-feedback>
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
            </b-row>
          </b-col>
          <b-col cols="11">
            <b-row>
              <b-col cols="9">
                <validation-provider
                  #default="validationContext"
                  name="Telepon"
                  rules="required"
                >
                  <b-form-group
                    label="Telepon"
                    label-for="h-telephone"
                    label-cols-md="3"
                  >
                    <cleave
                      id="h-telephone"
                      v-model="formData.pickup_contact2"
                      class="form-control"
                      :raw="false"
                      :options="options.numberOnly"
                      placeholder="Telepon"
                      :state="getValidationState(validationContext)"
                    />
                    <b-form-invalid-feedback>
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
            </b-row>
          </b-col>
          <b-col lg="12">
            <b-row>
              <b-col cols="5">
                <b-form-group
                  label="Tipe Kiriman"
                  label-for="h-contract-no"
                  label-cols-md="5"
                >
                  <v-select
                    id="h-province-code"
                    v-model="formData.pickup_payment"
                    :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                    :options="paymentMethod"
                    :clearable="false"
                    label="title"
                    placeholder="Pilih..."
                  />
                </b-form-group>
              </b-col>
            </b-row>
          </b-col>
          <b-col cols="12">
            <b-row>
              <b-col cols="5">
                <validation-provider
                  #default="validationContext"
                  name="Total Koli"
                  rules="required"
                >
                  <b-form-group
                    label="Total Koli"
                    label-for="h-koli"
                    label-cols-md="5"
                  >
                    <cleave
                      id="h-koli"
                      v-model="formData.pickup_qty"
                      class="form-control"
                      :raw="false"
                      :options="options.numberThousand"
                      placeholder="Total Koli"
                      :state="getValidationState(validationContext)"
                    />
                    <b-form-invalid-feedback>
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
            </b-row>
          </b-col>
          <b-col cols="12">
            <b-row>
              <b-col cols="5">
                <validation-provider
                  #default="validationContext"
                  name="Total Berat"
                  rules="required"
                >
                  <b-form-group
                    label="Total Berat"
                    label-for="h-weight"
                    label-cols-md="5"
                  >
                    <cleave
                      id="h-telephone"
                      v-model="formData.pickup_weight"
                      class="form-control"
                      :raw="false"
                      :options="options.numberThousand"
                      placeholder="Total Berat"
                      :state="getValidationState(validationContext)"
                    />
                    <b-form-invalid-feedback>
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
            </b-row>
          </b-col>
          <b-col cols="12">
            <b-row>
              <b-col cols="5">
                <b-form-group
                  label="Tanggal Pick up"
                  label-for="h-date-of-birth"
                  label-cols-md="5"
                >
                  <b-form-datepicker
                    locale="id"
                    id="h-date-of-birth"
                    v-model="formData.pickup_date"
                    :show-decade-nav="true"
                    :hide-header="true"
                    placeholder="Tanggal Pick up"
                  />
                </b-form-group>
              </b-col>
            </b-row>
          </b-col>
          <b-col cols="12">
            <b-row>
              <b-col cols="5">
                <validation-provider
                  #default="validationContext"
                  name="Pick up Ready Time"
                  rules="required"
                >
                  <b-form-group
                    label="Pick up Ready Time"
                    label-for="h-telephone"
                    label-cols-md="5"
                  >
                    <flat-pickr
                      v-model="formData.pickup_time"
                      class="form-control"
                      placeholder="Jam"
                      :config="{ enableTime: true, noCalendar: true, dateFormat: 'H:i', time_24hr: true }"
                    />
                    <b-form-invalid-feedback>
                      {{ validationContext.errors[0] }}
                    </b-form-invalid-feedback>
                  </b-form-group>
                </validation-provider>
              </b-col>
            </b-row>
          </b-col>
          <b-col cols="11">
            <b-row>
              <b-col cols="9">
                <b-form-group
                  label="Keterangan"
                  label-for="h-pickup-address"
                  label-cols-md="3"
                >
                  <b-form-textarea
                    id="h-pickup-address"
                    v-model="formData.pickup_description"
                    placeholder="Keterangan"
                  />
                </b-form-group>
              </b-col>
            </b-row>
          </b-col>

          <!-- submit and reset -->
          <b-col offset-md="2">
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
  </b-card>
</template>

<script>
import {
  BCard, BRow, BCol, BFormGroup, BFormInput, BPagination, BFormTextarea, BFormSelect, BFormDatepicker, BFormInvalidFeedback, BForm, BButton,
} from 'bootstrap-vue'
import { VueGoodTable } from 'vue-good-table'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'
import AppCollapse from '@core/components/app-collapse/AppCollapse.vue'
import AppCollapseItem from '@core/components/app-collapse/AppCollapseItem.vue'
import AppNoCollapseItem from '@core/components/app-collapse/AppNoCollapseItem.vue'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required, alphaNum } from '@validations'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import flatPickr from 'vue-flatpickr-component'
import Cleave from 'vue-cleave-component'
import 'cleave.js/dist/addons/cleave-phone.id'
import branch from '@/@fake-db/data/other/branch'
import office from '@/@fake-db/data/other/office'
import companyId from '@/@fake-db/data/other/companyId'
import idAccount from '@/@fake-db/data/other/idAccount'
import idEmployee from '@/@fake-db/data/other/idEmployee'
import userGroup from '@/@fake-db/data/other/userGroup'
import yesNo from '@/@fake-db/data/other/yesNo'
import store from '@/store/index'

export default {
  components: {
    BCard,
    BRow,
    BCol,
    BPagination,
    VueGoodTable,
    Cleave,
    BFormGroup,
    BFormInput,
    BFormSelect,
    BFormTextarea,
    BFormDatepicker,
    BFormInvalidFeedback,
    BForm,
    BButton,
    vSelect,
    AppCollapse,
    AppNoCollapseItem,
    AppCollapseItem,
    flatPickr,

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

      options: {
        numberOnly: {
          numeral: true,
          numeralThousandsGroupStyle: 'none'
        },
        numberThousand: {
          numeral: true,
        },
        phone_number: {
          phone: true,
          phoneRegionCode: 'ID',
        },
      },

      paymentMethod: [
        'CASH',
        'CREDIT'
      ],

      formData: {
        pickup_branch_code: 'JKT',
        pickup_branch_name: 'JAKARTA',
        pickup_office_code: 'JKT0001',
        pickup_office_name: 'SML CIBUBUR',
        pickup_sysdate: null,
        pickup_payment: 'CASH',
        pickup_address: null,
        pickup_contact1: null,
        pickup_contact2: null,
        pickup_goodstype: null,
        pickup_qty: '',
        pickup_weight: '',
        pickup_transport: null,
        pickup_date: '',
        pickup_time: null,
        pickup_description: ''
      },

      pageLength: 10,
      dir: false,
      columns: [
        {
          label: 'No.',
          field: 'no',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'No. Resi',
          field: 'no_resi',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Referensi',
          field: 'referemce',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Tanggal',
          field: 'date',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Penerima',
          field: 'consignee',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Kota Tujuan',
          field: 'city_destination',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Jenis Produk',
          field: 'product_type',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Jenis Kiriman',
          field: 'delivery_type',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Kuantitas',
          field: 'quantity',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Berat (kg)',
          field: 'weight',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
        {
          label: 'Volume',
          field: 'volume',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
      ],
      rows_procces: [],
      rows_void: [],
      searchOption: '',
    }
  },

  mounted() {
    this.formData.pickup_sysdate = new Date()
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
    getValidationState({ dirty, validated, valid = null }) {
      return dirty || validated ? valid : null;
    },
    resetForm() {
      this.password_confirm = '',
      this.formData = {
        pickup_branch_code: 'JKT',
        pickup_branch_name: 'JAKARTA',
        pickup_office_code: 'JKT0001',
        pickup_office_name: 'SML CIBUBUR',
        pickup_sysdate: null,
        pickup_payment: 'CASH',
        pickup_address: null,
        pickup_contact1: null,
        pickup_contact2: null,
        pickup_goodstype: null,
        pickup_qty: '',
        pickup_weight: '',
        pickup_transport: null,
        pickup_date: '',
        pickup_time: null,
        pickup_description: ''
      };
    },
    onSubmit() {
      const data = {
        no_pickup_order: 'AB0003',
        no_sppb: 'BA0001',
        pickup_branch_code: this.formData.pickup_branch_code,
        pickup_branch_name: this.formData.pickup_branch_name,
        pickup_office_code: this.formData.pickup_office_code,
        pickup_office_name: this.formData.pickup_office_name,
        pickup_sysdate: this.formData.pickup_sysdate,
        pickup_payment: this.formData.pickup_payment,
        pickup_address: this.formData.pickup_address,
        pickup_contact1: this.formData.pickup_contact1,
        pickup_contact2: this.formData.pickup_contact2,
        pickup_goodstype: this.formData.pickup_goodstype,
        pickup_qty: this.formData.pickup_qty,
        pickup_weight: this.formData.pickup_weight,
        pickup_transport: this.formData.pickup_transport,
        pickup_date: this.formData.pickup_date,
        pickup_time: this.formData.pickup_time,
        pickup_description: this.formData.pickup_description,
      };

      console.log(data)

      this.$store.dispatch('pickup_request/ADD_PICKUP_ORDER', data).then(() => {
        this.$router.push('/masterdata/users')
        .then(() => {
          this.$toast({
            component: ToastificationContent,
            position: 'top-right',
            props: {
              title: `Berhasil Request Pickup`,
              icon: 'ThumbsUpIcon',
              variant: 'success',
              text: `Anda telah berhasil request pickup pada tanggal ${data.pickup_date}!`,
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
@import '@assets/scss/custom/accordion-custom.scss';
@import '@core/scss/vue/libs/vue-select.scss';
@import '@core/scss/vue/libs/vue-good-table.scss';
@import '@assets/scss/custom/vgt-custom.scss';
@import '@core/scss/vue/libs/vue-flatpicker.scss';
</style>
