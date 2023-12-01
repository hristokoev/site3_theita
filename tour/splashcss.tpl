<style>
	body {
		background: #000;
	}
	.header-end {
		width: auto !important;
	}
	/* Show when splash */
	.button.splash {
		display: block;
	}
	.warning-container {
		overflow: auto;
		display: grid;
		grid-template-columns: 83.33%;
		height: 100vh;
		justify-content: center;
		padding: 4rem;
		z-index: 110;
	}
	@media only screen and (max-width: 576px) {
		.warning-container {
			grid-template-columns: 100%;
			padding: 1rem;
		}
	}
	.warning-wrapper {
		display: flex;
		justify-content: center;
		flex-direction: column;
		align-items: center;
	}
	@media only screen and (max-width: 576px) {
		.warning-wrapper {
			margin: 1rem auto;
		}
	}
	.warning-title {
		margin: 0 0 1rem;
		color: #fff;
	}
	.warning-text {
		text-align: center;
		padding: 1rem;
		color: #ddd;
	}
	.warning-text p {
		padding: 0.5rem 0;
	}
	.warning-agree {
		margin: 1rem 0 0;
	}
	.warning-disagree {
		font-size: 0.8rem;
		margin: 0.5rem 0 0;
		color: #fff;
	}
	@media only screen and (max-width: 576px) {
		.warning-disagree {
			font-size: 1rem;
			margin: 1rem;
		}
	}
	.warning-disagree a {
		font-weight: 700;
	}
	.warning-container .info {
		text-align: center;
		font-size: 0.65rem;
		padding: 2rem 0 0;
		color: #fff;
	}
</style>