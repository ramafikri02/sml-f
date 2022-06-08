<template>
  <b-card
    title="Entri Incoming"
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
          <b-col lg="8">
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
                  label="Cabang Tujuan"
                  label-for="h-branch"
                  label-cols-md="7"
                >
                  <b-form-input
                    id="h-branch"
                    v-model="formData.full_name"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="5">
                <b-form-group
                >
                  <b-form-input
                    id="h-branch"
                    v-model="formData.full_name"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="7">
                <b-form-group
                  label="Kantor Tujuan"
                  label-for="h-branch"
                  label-cols-md="7"
                >
                  <b-form-input
                    id="h-branch"
                    v-model="formData.full_name"
                  />
                </b-form-group>
              </b-col>
              <b-col cols="5">
                <b-form-group
                >
                  <b-form-input
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
                      label="No. Resi"
                      label-for="h-nopickup-spbb"
                      label-cols-md="6"
                    >
                      <b-form-input
                        id="h-nopickup-spbb"
                        v-model="formData.receipt_no"
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
                        id="h-nopickup-spbb"
                        v-model="formData.receipt_no"
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

          <b-row class="mt-2">
            <b-col cols="12">
              <app-collapse-item :isVisible="true" title="Daftar Resi yang Akan Diproses">
                <vue-good-table
                  :columns="columns"
                  :rows="rows_procces"
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
              </app-collapse-item>
            </b-col>
            <b-col cols="12">
              <app-collapse-item :isVisible="true" title="Daftar Resi yang Tidak Diproses">
                <vue-good-table
                  :columns="columns"
                  :rows="rows_void"
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
              </app-collapse-item>
            </b-col>
          </b-row>

        </app-collapse>

      </b-form>
    </validation-observer>
  </b-card>
</template>

<script>
import {
  BCard, BRow, BCol, BFormGroup, BFormInput, BFormTextarea, BFormDatepicker, BFormInvalidFeedback, BForm, BButton,
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
    VueGoodTable,
    BFormGroup,
    BFormInput,
    BFormTextarea,
    BFormDatepicker,
    BFormInvalidFeedback,
    BForm,
    BButton,
    vSelect,
    AppCollapse,
    AppNoCollapseItem,
    AppCollapseItem,

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
        receipt_no: '',
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
          label: 'Asal',
          field: 'origin',
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
          label: 'Jenis Kiriman',
          field: 'delivery_type',
          thClass: 'text-center',
          tdClass: 'text-center',
        },
      ],
      rows_procces: [],
      rows_void: [],
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
@import '@assets/scss/custom/accordion-custom.scss';
@import '@core/scss/vue/libs/vue-select.scss';
@import '@core/scss/vue/libs/vue-good-table.scss';
@import '@assets/scss/custom/vgt-custom.scss';
</style>
