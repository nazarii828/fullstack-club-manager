<template>
	<LayoutNavBar />

	<section
		class="container flex flex-col justify-center items-center h-screen"
	>
		<div id="signLawText">
			<h1
				class="text-san-marino-600 uppercase font-display font-bold text-3xl md:text-4xl lg:text-[2.85rem] lg:leading-[2.95rem] text-center mb-3"
			>
				Autentificare in cont
			</h1>
			<div class="heading__line"></div>

			<h3 class="font-body font-semibold text-center mb-3">
				sau
				<NuxtLink to="/sign-up" class="text-san-marino-600"
					>creeaza un cont nou</NuxtLink
				>
			</h3>
		</div>

		<div id="signInForm">
			<div class="container w-screen px-4 py-4">
				<div class="mx-auto w-1/2 rounded-2xl bg-white shadow-md">
					<Disclosure :default-open="true">
						<DisclosurePanel
							class="p-4 text-center font-body font-semibold text-sm text-gray-500"
						>
							<form @submit.prevent="signIn()" class="space-y-3">
								<ErrorMessage
									v-if="hasError"
									:errorMessage="errorMessage"
								/>

								<SuccessMessage
									v-if="hasSuccess"
									:successMessage="successMessage"
								/>
								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="emailAddress"
											class="sr-only"
										>
											Adresa de e-mail
										</label>
										<input
											id="emailAddress"
											v-model="emailAddress"
											name="emailAddress"
											type="text"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Adresa de e-mail"
										/>
									</div>
								</div>

								<div class="flex flex-row rounded-md gap-2">
									<div class="w-full">
										<label
											for="userPassword"
											class="sr-only"
										>
											Parola
										</label>
										<input
											id="userPassword"
											v-model="userPassword"
											name="userPassword"
											type="password"
											class="shadow-sm appearance-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-san-marino-500 focus:border-san-marino-500 focus:z-10 sm:text-sm"
											placeholder="Parola"
										/>
									</div>
								</div>

								<div>
									<button
										type="submit"
										class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm rounded-md text-white bg-san-marino-600 hover:bg-san-marino-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-san-marino-500"
									>
										<span
											class="absolute left-0 inset-y-0 flex items-center pl-3"
										>
											<LockClosedIcon
												class="h-5 w-5 text-nepal-500 group-hover:text-nepal-400"
												aria-hidden="true"
											/>
										</span>
										Intra in cont
									</button>
								</div>
							</form>
						</DisclosurePanel>
					</Disclosure>
				</div>
			</div>
		</div>
	</section>

	<LayoutFooter />
</template>

<script setup>
import { Disclosure, DisclosurePanel } from "@headlessui/vue";
import { LockClosedIcon } from "@heroicons/vue/20/solid";

const emailAddress = ref("");
const userPassword = ref("");
let hasError = ref(false);
let errorMessage = ref("");

let hasSuccess = ref(false);
let successMessage = ref("");

const { auth } = useSupabaseAuthClient();
const user = useSupabaseUser();

const signIn = async () => {
	let { data, error } = await auth.signInWithPassword({
		email: emailAddress.value,
		password: userPassword.value,
	});

	if (error) {
		hasSuccess.value = false;
		hasError.value = true;
		errorMessage.value = "Eroare la autentificare, datele sunt invalide!";
	} else {
		hasError.value = false;
		hasSuccess.value = true;
		successMessage.value = "Te-ai autentificat cu succes!";
	}
};

watchEffect(() => {
	if (user.value) {
		return navigateTo("/dashboard");
	}
});
</script>
