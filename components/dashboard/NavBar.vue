<template>
	<nav class="w-full p-3 bg-white border">
		<div class="flex items-center justify-between">
			<!-- Logo -->
			<div class="navbar-brand">
				<div class="flex justify-center md:justify-start gap-2">
					<svg
						xmlns="http://www.w3.org/2000/svg"
						className="h-6 w-6"
						fill="none"
						viewBox="0 0 24 24"
						stroke="currentColor"
						strokeWidth="{2}"
						width="24"
						height="24"
						class="text-san-marino-500"
					>
						<path
							strokeLinecap="round"
							strokeLinejoin="round"
							d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"
						></path>
					</svg>
					<NuxtLink to="/dashboard">
						<span class="font-display font-black"
							>ZERO SAPTE SERVICES</span
						>
					</NuxtLink>
				</div>
				<a
					role="button"
					class="navbar-burger"
					aria-label="menu"
					aria-expanded="false"
					data-target="navbarBasicExample"
					><span aria-hidden="true"></span
					><span aria-hidden="true"></span
					><span aria-hidden="true"></span
				></a>
			</div>
			<!-- Mobile toggle -->
			<div class="flex items-center md:hidden">
				<button @click="drawer">
					<svg
						class="h-8 w-8 fill-current text-black"
						fill="none"
						stroke-linecap="round"
						stroke-linejoin="round"
						stroke-width="2"
						viewBox="0 0 24 24"
						stroke="currentColor"
					>
						<path d="M4 6h16M4 12h16M4 18h16"></path>
					</svg>
				</button>
			</div>

			<!-- Navbar -->
			<div class="hidden md:block">
				<ul class="flex space-x-6 text-sm font-sans items-center">
					<li>
						<NuxtLink
							to="/dashboard"
							class="inline-block rounded-lg py-1 px-2 text-sm text-slate-700 hover:bg-slate-100 hover:text-slate-900 font-display font-medium"
							>Prima pagina</NuxtLink
						>
					</li>
					<li v-if="userRole === 'ADMIN'">
						<NuxtLink
							to="/dashboard/users"
							class="inline-block rounded-lg py-1 px-2 text-sm text-slate-700 hover:bg-slate-100 hover:text-slate-900 font-display font-medium"
							>Utilizatori</NuxtLink
						>
					</li>
					<li
						v-if="
							categoriesMod.indexOf('ANTRENORI') !== -1 ||
							userRole === 'ADMIN'
						"
					>
						<NuxtLink
							to="/dashboard/coaches"
							class="inline-block rounded-lg py-1 px-2 text-sm text-slate-700 hover:bg-slate-100 hover:text-slate-900 font-display font-medium"
							>Antrenori</NuxtLink
						>
					</li>
					<li
						v-if="
							categoriesMod.indexOf('VETERANI') !== -1 ||
							userRole === 'ADMIN'
						"
					>
						<NuxtLink
							to="/dashboard/veterans"
							class="inline-block rounded-lg py-1 px-2 text-sm text-slate-700 hover:bg-slate-100 hover:text-slate-900 font-display font-medium"
							>Veterani</NuxtLink
						>
					</li>
					<li
						v-if="
							categoriesMod.indexOf('CLUBURI') !== -1 ||
							userRole === 'ADMIN'
						"
					>
						<NuxtLink
							to="/dashboard/clubs"
							class="inline-block rounded-lg py-1 px-2 text-sm text-slate-700 hover:bg-slate-100 hover:text-slate-900 font-display font-medium"
							>Cluburi</NuxtLink
						>
					</li>
					<li
						class="hidden md:ml-6 md:flex md:items-center md:border-l md:border-slate-900/15 md:pl-6"
					>
						<button
							class="inline-block rounded-lg py-1 px-2 text-sm text-slate-700 hover:bg-slate-100 hover:text-slate-900 font-display font-medium"
							@click="logout"
						>
							Logout
						</button>
					</li>
				</ul>
			</div>

			<!-- Dark Background Transition -->
			<transition
				enter-class="opacity-0"
				enter-active-class="ease-out transition-medium"
				enter-to-class="opacity-100"
				leave-class="opacity-100"
				leave-active-class="ease-out transition-medium"
				leave-to-class="opacity-0"
			>
				<div
					@keydown.esc="isOpen = false"
					v-show="isOpen"
					class="z-10 fixed inset-0 transition-opacity duration-[600ms]"
				>
					<div
						@click="isOpen = false"
						class="absolute inset-0 bg-black opacity-50"
						tabindex="0"
					></div>
				</div>
			</transition>

			<!-- Drawer Menu -->
			<aside
				class="p-5 transform top-0 left-0 w-64 bg-white fixed h-full overflow-auto ease-in-out transition-all duration-[600ms] z-30"
				:class="isOpen ? 'translate-x-0' : '-translate-x-full'"
			>
				<div class="close">
					<button
						class="absolute top-0 right-0 mt-4 mr-4"
						@click="isOpen = false"
					>
						<svg
							class="w-6 h-6"
							fill="none"
							stroke-linecap="round"
							stroke-linejoin="round"
							stroke-width="2"
							viewBox="0 0 24 24"
							stroke="currentColor"
						>
							<path d="M6 18L18 6M6 6l12 12"></path>
						</svg>
					</button>
				</div>

				<ul class="divide-y font-sans">
					<li>
						<NuxtLink
							to="/dashboard"
							@click="isOpen = false"
							class="my-4 inline-block"
							>Prima pagina</NuxtLink
						>
					</li>
					<li v-if="userRole === 'ADMIN'">
						<NuxtLink
							to="/dashboard/users"
							@click="isOpen = false"
							class="my-4 inline-block"
							>Utilizatori</NuxtLink
						>
					</li>
					<li
						v-if="
							categoriesMod.indexOf('ANTRENORI') !== -1 ||
							userRole === 'ADMIN'
						"
					>
						<NuxtLink
							to="/dashboard/coaches"
							@click="isOpen = false"
							class="my-4 inline-block"
							>Antrenori</NuxtLink
						>
					</li>
					<li
						v-if="
							categoriesMod.indexOf('VETERANI') !== -1 ||
							userRole === 'ADMIN'
						"
					>
						<NuxtLink
							to="/dashboard/veterans"
							@click="isOpen = false"
							class="my-4 inline-block"
							>Veterani</NuxtLink
						>
					</li>
					<li
						v-if="
							categoriesMod.indexOf('CLUBURI') !== -1 ||
							userRole === 'ADMIN'
						"
					>
						<NuxtLink
							to="/dashboard/clubs"
							@click="isOpen = false"
							class="my-4 inline-block"
							>Veterani</NuxtLink
						>
					</li>
					<li>
						<button
							@click="logout"
							class="mt-8 mb-4 w-full text-center font-semibold inline-block bg-blue-500 hover:bg-blue-600 px-3 py-2 rounded text-white"
						>
							Logout
						</button>
					</li>
				</ul>
			</aside>
		</div>
	</nav>
</template>

<script setup>
const { auth } = useSupabaseAuthClient();
const supabase = useSupabaseClient();
const isOpen = ref(false);

// Get authenticated user.
const {
	data: { user },
} = await supabase.auth.getUser();

// Retrieve user's role.
const role = await getRole(user.id);
const userRole = role[0].role;

// Retrieve user's category moderator.
const categories = await getCategory(user.id);
const categoriesMod = categories[0].categoryMod;

const drawer = () => {
	return (isOpen.value = !isOpen.value);
};

const logout = async () => {
	return await auth.signOut().then(() => {
		location.href = "/";
	});
};

onMounted(() => {
	document.addEventListener("keydown", (e) => {
		if (e.keyCode == 27 && isOpen.value) isOpen.value = false;
	});
});
</script>

<style>
.dropdown:hover .dropdown-menu {
	display: block;
}
</style>
