<script setup>
import { ref } from "vue";
definePageMeta({
  layout: "admin",
});

const users = ref([
  {
    name: "John Doe",
    email: "john.doe@gmail.com",
    superUser: true,
    active: true,
  },
  {
    name: "Jane Doe",
    email: "jane.doe@gmail.com",
    superUser: true,
    active: false,
  },
  {
    name: "Bob Ross",
    email: "bob.ross@gmail.com",
    superUser: false,
    active: false,
  },
]);

const isSuperUser = (s) => {
  return s ? "Yes" : "No";
};

const disableUser = (email) => {
  users.value = users.value.map((u) => {
    if (u.email === email) {
      u.active = !u.active;
    }
    return u;
  });
};
</script>
<template>
  <div class="relative overflow-x-auto">
    <table
      class="w-full text-sm text-left text-gray-500 dark:text-gray-400 mb-3"
    >
      <thead
        class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400"
      >
        <tr>
          <th scope="col" class="px-6 py-3">Name</th>
          <th scope="col" class="px-6 py-3">Email</th>
          <th scope="col" class="px-6 py-3 text-center">Super user</th>
          <th scope="col" class="px-6 py-3 text-center">Active</th>
          <th scope="col" class="px-6 py-3 text-center">Disable</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(user, idx) in users"
          :key="idx"
          class="bg-white border-b dark:bg-gray-800 dark:border-gray-700"
        >
          <th
            scope="row"
            class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white"
          >
            {{ user["name"] }}
          </th>
          <td class="px-6 py-4">{{ user["email"] }}</td>
          <td class="px-6 py-4 text-center">
            {{ isSuperUser(user["superUser"]) }}
          </td>
          <td class="px-6 py-4 text-center">
            {{ isSuperUser(user["active"]) }}
          </td>
          <td class="px-6 py-4 text-center">
            <input
              id="default-checkbox"
              type="checkbox"
              value=""
              class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
              @click="disableUser(user['email'])"
            />
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
