-- for fast reloading
function ClipWeapon:GetCatalystSpeedBase()
    if self:GetIsReloading() then
        local player = self:GetParent()
        if player then
            return player:GotFastReload() and 1.75 or 1
        end
    end
    return 1
end

local kBulletSize = 0.08 -- was 0.018
function ClipWeapon:GetBulletSize()
    return kBulletSize
end