<template>
  <b-card
    title="Entri Disbag Manifest"
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
                        v-uppercase
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
                    name="Jenis Manifest"
                    rules="required"
                  >
                    <b-form-group
                      label="Jenis Manifest"
                      label-for="h-manifest-type"
                      label-cols-md="4"
                    >
                      <v-select
                        v-uppercase
                        id="h-manifest-type"
                        v-model="formData.manifest_type"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="manifestTypeOp"
                        label="title"
                        placeholder="Pilih..."
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
                    name="Nama Vendor"
                    rules="required"
                  >
                    <b-form-group
                      label="Nama Vendor"
                      label-for="h-manifest-type"
                      label-cols-md="4"
                    >
                      <v-select
                        v-uppercase
                        id="h-manifest-type"
                        v-model="formData.vendor_name"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="manifestTypeOp"
                        label="title"
                        placeholder="Pilih..."
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
                    name="Cabang Tujuan"
                    rules="required"
                  >
                    <b-form-group
                      label="Cabang Tujuan"
                      label-for="h-manifest-type"
                      label-cols-md="4"
                    >
                      <v-select
                        v-uppercase
                        id="h-manifest-type"
                        v-model="formData.branch_destination"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="branchOp"
                        label="title"
                        placeholder="Pilih..."
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
                    name="Kantor Tujuan"
                    rules="required"
                  >
                    <b-form-group
                      label="Kantor Tujuan"
                      label-for="h-manifest-type"
                      label-cols-md="4"
                    >
                      <v-select
                        v-uppercase
                        id="h-manifest-type"
                        v-model="formData.office_destination"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="officeOp"
                        label="title"
                        placeholder="Pilih..."
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
                    name="Cabang Transit"
                    rules="required"
                  >
                    <b-form-group
                      label="Cabang Transit"
                      label-for="h-manifest-type"
                      label-cols-md="4"
                    >
                      <v-select
                        v-uppercase
                        id="h-manifest-type"
                        v-model="formData.transit_branch"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="branchOp"
                        label="title"
                        placeholder="Pilih..."
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
                    name="Jenis Porduct"
                    rules="required"
                  >
                    <b-form-group
                      label="Jenis Porduct"
                      label-for="h-manifest-type"
                      label-cols-md="4"
                    >
                      <v-select
                        v-uppercase
                        id="h-manifest-type"
                        v-model="formData.product_type"
                        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                        :options="manifestTypeOp"
                        label="title"
                        placeholder="Pilih..."
                      />
                      <b-form-invalid-feedback>
                        {{ validationContext.errors[0] }}
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </validation-provider>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Nopol"
                    label-for="h-manifest-type"
                    label-cols-md="4"
                  >
                    <v-select
                      v-uppercase
                      id="h-manifest-type"
                      v-model="formData.nopol"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      :options="manifestTypeOp"
                      label="title"
                      placeholder="Pilih..."
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Bagian Box"
                    label-for="h-manifest-type"
                    label-cols-md="4"
                  >
                    <v-select
                      v-uppercase
                      id="h-manifest-type"
                      v-model="formData.box_section"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      :options="manifestTypeOp"
                      label="title"
                      placeholder="Pilih..."
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Supir"
                    label-for="h-manifest-type"
                    label-cols-md="4"
                  >
                    <v-select
                      v-uppercase
                      id="h-manifest-type"
                      v-model="formData.driver"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      :options="manifestTypeOp"
                      label="title"
                      placeholder="Pilih..."
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Kurir/Driver 1"
                    label-for="h-manifest-type"
                    label-cols-md="4"
                  >
                    <v-select
                      v-uppercase
                      id="h-manifest-type"
                      v-model="formData.courier1"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      :options="manifestTypeOp"
                      label="title"
                      placeholder="Pilih..."
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Kurir/Driver 2"
                    label-for="h-manifest-type"
                    label-cols-md="4"
                  >
                    <v-select
                      v-uppercase
                      id="h-manifest-type"
                      v-model="formData.courier2"
                      :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
                      :options="manifestTypeOp"
                      label="title"
                      placeholder="Pilih..."
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Jam Muat Awal"
                    label-for="h-time"
                    label-cols-md="4"
                  >
                    <flat-pickr
                      v-model="formData.early_load_hours"
                      class="form-control"
                      :config="configTime"
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Jam Muat Akhir"
                    label-for="h-time"
                    label-cols-md="4"
                  >
                    <flat-pickr
                      v-model="formData.final_load_hours"
                      class="form-control"
                      :config="configTime"
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Jam Berangkat"
                    label-for="h-time"
                    label-cols-md="4"
                  >
                    <flat-pickr
                      v-model="formData.departure_time"
                      class="form-control"
                      :config="configTime"
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Keterangan"
                    label-for="h-description"
                    label-cols-md="4"
                  >
                    <b-form-textarea
                      id="h-description"
                      v-model="formData.description"
                      placeholder="Keterangan"
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="12">
                  <b-form-group
                    label="Volume"
                    label-for="h-volume"
                    label-cols-md="4"
                  >
                    <cleave
                      id="h-volume"
                      v-model="formData.volume"
                      class="form-control"
                      :raw="false"
                      :options="options.numberOnly"
                      placeholder="Volume"
                    />
                  </b-form-group>
                </b-col>
              </b-row>
            </b-col>
          </b-row>

          <app-collapse
            class="accordion-sml"
            type="margin"
          >
            <b-row>
              <b-col cols="6">
                <app-no-collapse-item :isVisible="true" title="Proses">
                  <b-row class="mt-1">
                    <b-col cols="9">
                    <b-form-group
                      label="No. Resi Dengan Validasi"
                      label-for="h-nopickup-spbb"
                      label-cols-md="6"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-nopickup-spbb"
                        v-model="formDataProses.no_resi"
                        @keyup.enter="addProses()"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="3">
                    <b-button
                      v-ripple.400="'rgba(0, 207, 232, 0.15)'"
                      v-b-modal.modal-info
                      variant="outline-info"
                      @click="addProses()"
                    >
                      Cari
                    </b-button>
                  </b-col>
                  </b-row>
                </app-no-collapse-item>
              </b-col>
              <b-col cols="6">
                <app-no-collapse-item :isVisible="true" title="Hapus">
                  <b-row class="mt-1">
                    <b-col cols="9">
                    <b-form-group
                      label="No. Resi"
                      label-for="h-nopickup-spbb"
                      label-cols-md="6"
                    >
                      <b-form-input
                        v-uppercase
                        id="h-nopickup-spbb"
                        v-model="formData.item_description"
                      />
                    </b-form-group>
                  </b-col>
                  <b-col cols="3">
                    <b-button
                      v-ripple.400="'rgba(0, 207, 232, 0.15)'"
                      v-b-modal.modal-info
                      variant="outline-info"
                    >
                      Cari
                    </b-button>
                  </b-col>
                  </b-row>
                </app-no-collapse-item>
              </b-col>
            </b-row>
          </app-collapse>

          <b-row class="mt-3 text-center">
            <b-col cols="12" >
              <!-- submit and reset -->
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
            </b-col>
          </b-row>
        </b-form>
    </validation-observer>

    <vue-good-table
      :columns="columns"
      :rows="rows"
      :rtl="direction"
      :pagination-options="{
        enabled: true,
        perPage:pageLength
      }"
      styleClass="vgt-table condensed"
      class="mt-2"
    >
      <template
        slot="table-row"
        slot-scope="props"
      >

        <!-- Column: Name -->
        <span
          v-if="props.column.field === 'no'"
        >
          <span class="font-weight-bold">{{ props.index+1 }}</span>
        </span>

        <!-- Column: Status -->
        <span v-else-if="props.column.field === 'status'">
          <b-badge :variant="statusVariant(props.row.status)">
            {{ props.row.status }}
          </b-badge>
        </span>

        <!-- Column: Action -->
        <span v-else-if="props.column.field === 'action'">
          <span>
            <b-dropdown
              variant="link"
              toggle-class="text-decoration-none"
              no-caret
            >
              <template v-slot:button-content>
                <feather-icon
                  icon="MoreVerticalIcon"
                  size="16"
                  class="text-body align-middle mr-25"
                />
              </template>
              <b-dropdown-item @click="toBranchEdit(props.row.branch_code)">
                <feather-icon
                  icon="Edit2Icon"
                  class="mr-50"
                />
                <span>Ubah</span>
              </b-dropdown-item>
              <b-dropdown-item @click="toBranchDelete(props.row.branch_code)">
                <feather-icon
                  icon="TrashIcon"
                  class="mr-50"
                />
                <span>Hapus</span>
              </b-dropdown-item>
            </b-dropdown>
          </span>
        </span>

        <!-- Column: Common -->
        <span v-else>
          {{ props.formattedRow[props.column.field] }}
        </span>
      </template>

      <!-- pagination -->
      <template
        slot="pagination-bottom"
        slot-scope="props"
      >
        <div class="d-flex justify-content-between flex-wrap">
          <div class="d-flex align-items-center mb-0 mt-1">
            <span class="text-nowrap ">
              Showing 1 to
            </span>
            <b-form-select
              v-model="pageLength"
              :options="['10','20','30']"
              class="mx-1"
              @input="(value)=>props.perPageChanged({currentPerPage:value})"
            />
            <span class="text-nowrap"> of {{ props.total }} entries </span>
          </div>
          <div>
            <b-pagination
              :value="1"
              :total-rows="props.total"
              :per-page="pageLength"
              first-number
              last-number
              align="right"
              prev-class="prev-item"
              next-class="next-item"
              class="mt-1 mb-0"
              @input="(value)=>props.pageChanged({currentPage:value})"
            >
              <template #prev-text>
                <feather-icon
                  icon="ChevronLeftIcon"
                  size="18"
                />
              </template>
              <template #next-text>
                <feather-icon
                  icon="ChevronRightIcon"
                  size="18"
                />
              </template>
            </b-pagination>
          </div>
        </div>
      </template>
    </vue-good-table>
  </b-card>
</template>

<script>
import {
  BCard, BRow, BCol, BFormGroup, BPagination, BFormInput, BFormSelect, BFormTextarea, BFormInvalidFeedback, BForm, BButton, BFormDatepicker,
} from 'bootstrap-vue'
import { VueGoodTable } from 'vue-good-table'
import Ripple from 'vue-ripple-directive'
import vSelect from 'vue-select'
import AppCollapse from '@core/components/app-collapse/AppCollapse.vue'
import AppNoCollapseItem from '@core/components/app-collapse/AppNoCollapseItem.vue'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required, alphaNum } from '@validations'
import flatPickr from 'vue-flatpickr-component'
import { Indonesian } from "flatpickr/dist/l10n/id.js"
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import Cleave from 'vue-cleave-component'
import branchOp from '@/@fake-db/data/other/branch'
import officeOp from '@/@fake-db/data/other/office'
import companyId from '@/@fake-db/data/other/companyId'
import idAccount from '@/@fake-db/data/other/idAccount'
import idEmployee from '@/@fake-db/data/other/idEmployee'
import userGroup from '@/@fake-db/data/other/userGroup'
import yesNo from '@/@fake-db/data/other/yesNo'
import manifestTypeOp from '@/@fake-db/data/other/manifestTypeOp'
import store from '@/store/index'

export default {
  components: {
    BCard,
    BRow,
    BCol,
    VueGoodTable,
    BPagination,
    BFormGroup,
    BFormInput,
    BFormSelect,
    BFormTextarea,
    BFormInvalidFeedback,
    BForm,
    BButton,
		BFormDatepicker,	
    vSelect,
    Cleave,
    AppCollapse,
    AppNoCollapseItem,

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

      options: {
        numberOnly: {
          numeral: true,
          numeralThousandsGroupStyle: 'none'
        },
      },

      configTime: {
        enableTime: true,
        dateFormat: 'Y-m-d H:i',
        locale: Indonesian,
        disableMobile: true
      }, 

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
				early_load_hours: null,
				final_load_hours: null,
				departure_time: null,
				description: '',
				volume: '',
      },

      formDataProses: {
        no_resi: '',
        no_tracking_label: '',
        date: '',
        destination: '',
        product_type: '',
        koli: '',
        weight: '',
        type: '',
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
          label: 'No. Tracking Label',
          field: 'no_tracking_label',
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
          label: 'Tujuan',
          field: 'destination',
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
          label: 'Koli',
          field: 'koli',
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
          label: 'Tipe',
          field: 'type',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
      ],
      rows: [],
    }
  },
  mounted() {
    this.formData.date = new Date()
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
    addProses() {
      if(this.formDataProses.no_resi == null || this.formDataProses.no_resi == '') {
        this.$toast({
          component: ToastificationContent,
          position: 'top-right',
          props: {
            title: `Gagal`,
            icon: 'ThumbsUpIcon',
            variant: 'danger',
            text: `Nomor Resi harus di isi!`,
          },
        })
      }
      else {
        if( this.rows.some(code => code.no_resi === this.formDataProses.no_resi)){
          this.$toast({
            component: ToastificationContent,
            position: 'top-right',
            props: {
              title: `Gagal tambah`,
              icon: 'ThumbsUpIcon',
              variant: 'danger',
              text: `Data yang anda masukkan sudah ada!`,
            },
          })
          console.log('Length : ', this.rows.length)
        }
        else {
          this.rows.push({
            no_resi: this.formDataProses.no_resi,
            // no_tracking_label: this.formDataProses.no_tracking_label,
            // date: this.formDataProses.date,
            // destination: this.formDataProses.destination,
            // product_type: this.formDataProses.product_type,
            // koli: this.formDataProses.koli,
            // weight: this.formDataProses.weight,
            // type: this.formDataProses.type,
            no_tracking_label: 'TEST',
            date: 'TEST',
            destination: 'TEST',
            product_type: 'TEST',
            koli: 'TEST',
            weight: 'TEST',
            type: 'TEST',
          })
          this.formDataProses.no_resi = ''
        }
      }
    },
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
@import '@core/scss/vue/libs/vue-flatpicker.scss';
@import '@core/scss/vue/libs/vue-select.scss';
@import '@assets/scss/custom/accordion-custom.scss';
@import '@core/scss/vue/libs/vue-good-table.scss';
@import '@assets/scss/custom/vgt-custom.scss';
</style>
