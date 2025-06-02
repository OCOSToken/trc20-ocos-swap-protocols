const fs = require('fs');
const path = require('path');
const csv = require('csv-parser');
const crypto = require('crypto');

// Parametrlər
const INPUT_FILE = process.argv[2]; // snapshot CSV faylı
const OUTPUT_DIR = path.join(__dirname, '../protocols');
const FIXED_RATE = 0.035; // 1 OCOS = 0.035 USDT

// Protokol çıxış qovluğunu yaradın
if (!fs.existsSync(OUTPUT_DIR)) {
    fs.mkdirSync(OUTPUT_DIR, { recursive: true });
}

// CSV oxuma və JSON yaradılması
function generateProtocolsFromCSV(filePath) {
    const results = [];

    fs.createReadStream(filePath)
        .pipe(csv())
        .on('data', (data) => results.push(data))
        .on('end', () => {
            results.forEach(entry => {
                const wallet = entry.wallet.trim();
                const amountOCOS = parseFloat(entry.amount_ocos);
                const timestamp = entry.timestamp || new Date().toISOString();
                const txHash = entry.tx_hash || crypto.randomBytes(16).toString('hex');

                if (!wallet || isNaN(amountOCOS)) return;

                const amountUSDT = parseFloat((amountOCOS * FIXED_RATE).toFixed(6));

                const snapshotData = `${wallet}|${amountOCOS}|${amountUSDT}|${timestamp}`;
                const snapshotHash = crypto.createHash('sha256').update(snapshotData).digest('hex');

                const protocol = {
                    wallet: wallet,
                    total_eligible_ocos: amountOCOS,
                    max_usdt_claimable: amountUSDT,
                    tx_log: [
                        {
                            tx_hash: txHash,
                            date: timestamp,
                            amount_ocos: amountOCOS,
                            amount_usdt: amountUSDT
                        }
                    ],
                    snapshot_hash: `sha256:${snapshotHash}`,
                    burn_status: "pending"
                };

                const outputPath = path.join(OUTPUT_DIR, `${wallet}.json`);
                fs.writeFileSync(outputPath, JSON.stringify(protocol, null, 4));
                console.log(`✔ Created: ${wallet}.json`);
            });

            console.log(`\n✅ ${results.length} protokol faylı yaradıldı.`);
        });
}

// Başlat
if (!INPUT_FILE) {
    console.error("⚠️  Zəhmət olmasa snapshot CSV fayl yolunu göstərin. Məsələn:");
    console.error("    node scripts/generateProtocol.js snapshots/snapshot_2023.csv");
    process.exit(1);
}

generateProtocolsFromCSV(INPUT_FILE);
