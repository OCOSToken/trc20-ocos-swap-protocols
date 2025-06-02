<script src="https://cdn.jsdelivr.net/npm/web3@1.8.0/dist/web3.min.js"></script>
<script>
let web3;
let vaultContract;
const vaultAddress = "0xYOUR_VAULT_CONTRACT";
const vaultAbi = [/* ABI buraya əlavə olunacaq */];

window.addEventListener("load", async () => {
  if (window.tronWeb && window.tronWeb.defaultAddress.base58) {
    web3 = new Web3(window.tronWeb.fullNode.host);
    vaultContract = new web3.eth.Contract(vaultAbi, vaultAddress);

    const userAddress = window.tronWeb.defaultAddress.base58;
    document.getElementById("wallet").innerText = "Cüzdan: " + userAddress;
  } else {
    alert("Zəhmət olmasa TronLink cüzdanını aktiv edin.");
  }
});

async function redeemOcos() {
  const ocosAmount = document.getElementById("redeemAmount").value;
  const ocosWei = web3.utils.toWei(ocosAmount, 'ether');
  const user = window.tronWeb.defaultAddress.base58;

  try {
    await vaultContract.methods.redeem(ocosWei).send({ from: user });
    alert("Mübadilə uğurla başa çatdı.");
  } catch (err) {
    console.error("Xəta:", err);
    alert("Əməliyyat baş tutmadı.");
  }
}
</script>
