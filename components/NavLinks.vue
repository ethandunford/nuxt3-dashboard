<script setup>
import AppSvg from "../components/AppSvg.vue";
</script>
<template>
  <ul class="space-y-2">
    <li>
      <RouterLink
        to="/"
        class="group flex items-center p-2 text-base font-normal text-gray-900 dark:text-green-500 hover:bg-white dark:hover:bg-gray-700 hover:text-green-500"
      >
        <AppSvg>
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25"
          />
        </AppSvg>
        <span class="ml-3 dark:group-hover:text-white">Home</span>
      </RouterLink>
    </li>
    <li>
      <RouterLink
        to="/edit-profile"
        class="group flex items-center p-2 text-base font-normal text-gray-900 dark:text-green-500 hover:bg-white dark:hover:bg-gray-700 hover:text-green-500"
      >
        <AppSvg>
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125"
          />
        </AppSvg>
        <span class="ml-3 dark:group-hover:text-white">Edit Profile</span>
      </RouterLink>
    </li>
    <RouterLink
      to="/change-password"
      class="group flex items-center p-2 text-base font-normal text-gray-900 dark:text-green-500 hover:bg-white dark:hover:bg-gray-700 hover:text-green-500"
    >
      <AppSvg>
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          d="M15.75 5.25a3 3 0 013 3m3 0a6 6 0 01-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 1121.75 8.25z"
        />
      </AppSvg>
      <span class="ml-3 dark:group-hover:text-white">Change Password</span>
    </RouterLink>
  </ul>

  <ul class="pt-4 mt-4 space-y-2 border-t border-gray-200 dark:border-gray-700">
    <li>
      <RouterLink
        to="/manage-users"
        class="group flex items-center p-2 text-base font-normal text-gray-900 dark:text-green-500 hover:bg-white dark:hover:bg-gray-700 hover:text-green-500"
      >
        <AppSvg>
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z"
          />
        </AppSvg>
        <span class="ml-3 dark:group-hover:text-white">Manage Users</span>
      </RouterLink>
    </li>
    <li>
      <RouterLink
        to="/create-user"
        class="group flex items-center p-2 text-base font-normal text-gray-900 dark:text-green-500 hover:bg-white dark:hover:bg-gray-700 hover:text-green-500"
      >
        <AppSvg>
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M19 7.5v3m0 0v3m0-3h3m-3 0h-3m-2.25-4.125a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zM4 19.235v-.11a6.375 6.375 0 0112.75 0v.109A12.318 12.318 0 0110.374 21c-2.331 0-4.512-.645-6.374-1.766z"
          />
        </AppSvg>
        <span class="ml-3 dark:group-hover:text-white">Create User</span>
      </RouterLink>
    </li>
  </ul>
  <ul class="pt-4 mt-4 space-y-2 border-t border-gray-200 dark:border-gray-700">
    <RouterLink
      to="/login"
      class="group flex items-center p-2 text-base font-normal text-gray-900 dark:text-green-500 hover:bg-white dark:hover:bg-gray-700 hover:text-green-500"
    >
      <AppSvg>
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15M12 9l-3 3m0 0l3 3m-3-3h12.75"
        />
      </AppSvg>
      <span class="ml-3 dark:group-hover:text-white">Logout</span>
    </RouterLink>
  </ul>
</template>
