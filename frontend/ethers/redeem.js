<script src="https://cdn.jsdelivr.net/npm/ethers@5.7.2/dist/ethers.umd.min.js"></script>
<script>
let provider, signer, vaultContract;
const vaultAddress = "0xYOUR_VAULT_CONTRACT";
const vaultAbi = [/* ABI burada */];

async function initEthers() {
  if (window.ethereum) {
    provider = new ethers.providers.Web3Provider(window.ethereum);
    await provider.send("eth_requestAccounts", []);
    signer = provider.getSigner();

    vaultContract = new ethers.Contract(vaultAddress, vaultAbi, signer);
    const userAddress = await signer.getAddress();
    document.getElementById("wallet").innerText = "Cüzdan: " + userAddress;
  } else {
    alert("Metamask və ya EVM uyğun cüzdan tələb olunur.");
  }
}

async function redeemOcos() {
  const ocosAmount = document.getElementById("redeemAmount").value;
  const ocosWei = ethers.utils.parseEther(ocosAmount);
  
  try {
    const tx = await vaultContract.redeem(ocosWei);
    await tx.wait();
    alert("Uğurla redeem edildi.");
  } catch (err) {
    console.error(err);
    alert("Əməliyyat uğursuz oldu.");
  }
}

window.onload = initEthers;
</script>
