-- Balance changes of vanila values
Script.Load("lua/Combat/Balance.lua")

kMaxScore = 16000 -- max of 16384 due to engine... -- was 9999

-- Experience based values like avgXpAmount is still in ExperienceData

-- Welcome Message that every player receives who joined our game
combatModifiedMessage = "This mod is not reflective of the standard NS2 experience!!"
combatWelcomeMessage = {combatModifiedMessage,
                        "This server is running a special Combat Mod V." .. kCombatVersion .. ".",
                        "This mod removes RTS elements and gives you upgrades for kills.",
                        "Score = XP and Resources = Upgrade Points to use.",
                        "For more information type /help in the chat or console."
                        }

                        
-- How often to send kills, deaths, nick name changes, etc. for scoreboard
kScoreboardUpdateInterval = 2

-- How often to send ping updates to individual players
kUpdatePingsIndividual = 5

-- How often to send ping updates to all players.
kUpdatePingsAll = 12
						
kCombatUpgradeNotifyInterval = 20
kCombatReminderNotifyInterval = 45
kDirectMessageFadeTime = 8
kDirectMessagesNumVisible = 9

-- Menu tweaks
kCombatAlienBuyMenuTotalAngle = 0.8
kCombatAlienBuyMenuUpgradeButtonDistance = 210

-- Set the respawn timer
kCombatRespawnTimer = 6
kAlienWaveSpawnInterval = 6
kCombatOvertimeRespawnTimer = 10

-- Rebalancing Intervals (secs)
kCombatRebalanceInterval = 300

-- Spawning radius and retries.
kSpawnMaxRetries = 50
kSpawnMinDistance = 3
kSpawnMaxDistance = 70
kSpawnMaxVertical = 10
kSpawnArmoryMaxRetries = 200
kArmorySpawnMinDistance = 7
kArmorySpawnMaxDistance = 60

-- By default, Aliens win after a certain amount of time...
-- Specified in seconds...
if kCombatCompMode == nil then
    kCombatCompMode = false
    kCombatTimeLimit = 1500
    kCombatAllowOvertime = true
    kCombatDefaultWinner = kTeam2Index
end

kCombatTimeReminderInterval = 300

-- make xpeffect less "spammy"
kXPEffectTimer = 0.2
kXPForgetTimer = 5

-- Props
kPropEffect = "vortex_destroy"
kPropEffectTimer = 2

-- Spawn protection
kCombatSpawnProtectDelay = 0.1
kCombatMarineSpawnProtectTime = 2
-- nano shield = spawn Protection
kNanoShieldDuration = kCombatMarineSpawnProtectTime 
-- Alien time includes time spent in the egg.
kCombatAlienSpawnProtectTime = kSkulkGestateTime + 2

-- No eggs
kAlienEggsPerHive = 0

-- The rate at which players heal the hive/cc should be multiplied by this ratio.
kHiveCCHealRate = 0.3
-- The rate at which players gain XP for healing... relative to damage dealt.
kHealXpRate = 0.5
-- Rate at which players gain XP for healing other players...
kPlayerHealXpRate = 0

-- kill hydras after some time if the owner isn't a gorge
kHydraKillTime = 30

-- Time delay for exo suits to power up.
kExoPowerUpTime = 3

-- Override the costs of each of our entries.
-- These won't take effect on the client side until we import this file into the client side mods

-- at the moment, nobody should buy something, it needs to be implemented before
kPlayerInitialIndivRes = 0
local generalCost = 99

kShotgunCost = generalCost
kMinesCost = generalCost
kGrenadeLauncherCost = generalCost
kFlamethrowerCost = generalCost
kJetpackCost = generalCost
kExosuitCost = generalCost
kMinigunCost = generalCost
kDualMinigunCost = generalCost

-- Used by alien buy menu
kGorgeCost = 1
kLerkCost = 2
kFadeCost = 4
kOnosCost = 5

kCarapaceCost = generalCost
kRegenerationCost = generalCost
kAuraCost = generalCost
kSilenceCost = generalCost
kHydraAbilityCost = generalCost
kHydraCost = 0
kWebBuildCost = 0
kPiercingCost = generalCost
kAdrenalineCost = generalCost
kFeintCost = generalCost
kSapCost = generalCost
kBoneShieldCost = generalCost
kCelerityCost = generalCost
kHyperMutationCost = generalCost
kGorgeTunnelCost = generalCost
kBabblerCost = 0

-- to get it loaded into the TechData
SetCachedTechData(kTechId.Hydra, kTechDataCostKey, kHydraCost)
SetCachedTechData(kTechId.GorgeTunnel, kTechDataCostKey, kGorgeTunnelCost)
SetCachedTechData(kTechId.BabblerEgg, kTechDataCostKey, kBabblerCost)
SetCachedTechData(kTechId.Web, kTechDataCostKey, kWebBuildCost)

-- Range for evolving to Onos/Exo from the Hive/CommandStation
kTechRange = 20.0

--set starting personal resources to 0
kMarineInitialIndivRes = 0
kAlienInitialIndivRes = 0

-- Cooldown for buying exo/onos
-- disabled this for better balance
kHeavyTechCooldown = 0

-- Alien Tier to Ability map
kCombatAlienTierTwoTechIds = { kTechId.Leap, kTechId.BabblerEgg, kTechId.BabblerAbility, kTechId.Umbra, kTechId.MetabolizeEnergy, kTechId.MetabolizeHealth, kTechId.Charge, kTechId.BoneShield }
kCombatAlienTierThreeTechIds = { kTechId.BileBomb, kTechId.Web, kTechId.BoneShield, kTechId.Spores, kTechId.Stab, kTechId.Stomp }
if not kCombatCompMode then
	-- Add Xenocide only if not competitive mode
	table.insert(kCombatAlienTierThreeTechIds, kTechId.Xenocide)
end
