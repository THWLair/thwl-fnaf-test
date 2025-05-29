playerState = ''
playerHp = 25
playerSpeed = 7
playerCooldown = 10
canDash = true
balls = 15
directionX = 0
directionY = 0
canBall = true

function onCreate()
	

	makeLuaSprite('zone', '', -200, -200)
	makeGraphic('zone', 4000, 4000, '303030')
	addLuaSprite('zone')

	makeLuaSprite('ground', '', -80, 200)
	makeGraphic('ground', 2060, 1020, '606060')
	addLuaSprite('ground')

	makeLuaSprite('mei', 'mei', 600, 600)
	setProperty('mei.antialiasing', false)
	addLuaSprite('mei')

	makeLuaSprite('atk', '')
	makeGraphic('atk', 100, 40, 'FFFFFF')
	addLuaSprite('atk')










	makeLuaSprite('hp', '', 40, 620)
	setObjectCamera('hp', 'hud')
	addLuaSprite('hp')
	setProperty('hp.angle', -5)

	makeLuaText('hpTxt', '', 50, 40, 620)
	setObjectCamera('hpTxt', 'hud')
	setTextSize('hpTxt', 24)
	addLuaText('hpTxt')
	setProperty('hpTxt.angle', -5)

	makeLuaText('hpAnim', '')

	makeLuaSprite('cooldown', '', 50, 650)
	setObjectCamera('cooldown', 'hud')
	addLuaSprite('cooldown')
	setProperty('cooldown.angle', -5)

	makeLuaText('cooldownTxt', '', 50, 50, 650)
	setObjectCamera('cooldownTxt', 'hud')
	setTextSize('cooldownTxt', 24)
	addLuaText('cooldownTxt')
	setProperty('cooldownTxt.angle', -5)

	makeLuaText('cooldownAnim', '')

	makeLuaSprite('balls', '', 1150, 600)
	makeGraphic('balls', 70, 70, 'FF8844')
	setObjectCamera('balls', 'hud')
	addLuaSprite('balls')
	doTweenAngle('ballsa', 'balls', getProperty('balls.angle') + 90, 1)

	makeLuaText('ballsTxt', '', 50, 1160, 620)
	setObjectCamera('ballsTxt', 'hud')
	setTextSize('ballsTxt', 24)
	addLuaText('ballsTxt')
	setProperty('ballsTxt.angle', 5)

	makeLuaSprite('ball', '', 0, 600)
	makeGraphic('ball', 70, 70, 'FF8844')
	setObjectCamera('ball', 'hud')
	addLuaSprite('ball')
	screenCenter('ball', 'x')
	doTweenAngle('balla', 'ball', getProperty('ball.angle') + 90, 1)

	makeLuaSprite('point', 'point')
	setObjectCamera('point', 'hud')
	setBlendMode('point', 'add')
	addLuaSprite('point')
	doTweenAngle('pointa', 'point', getProperty('point.angle') + 90, 0.6, 'backOut')

end

function onUpdate()

	doTweenX('cooldownAnim', 'cooldownAnim', playerCooldown, 1, 'circOut')
	makeGraphic('cooldown', (getProperty('cooldownAnim.x') / 10) * 120, 20, 'FFFFFF')
	setTextString('cooldownTxt', string.format("%.0f", getProperty('cooldownAnim.x')))

	doTweenX('hpAnim', 'hpAnim', playerHp, 1, 'circOut')
	makeGraphic('hp', (getProperty('hpAnim.x') / 25) * 120, 20, 'FF8888')
	setTextString('hpTxt', string.format("%.0f", getProperty('hpAnim.x')))

	setTextString('ballsTxt', balls)

	doTweenX('pointx', 'point', getMouseX('hud') - 18, 0.2, 'circOut')
	doTweenY('pointy', 'point', getMouseY('hud') - 18, 0.2, 'circOut')

	if mouseClicked('left') then
		setProperty('point.scale.x', 0.8)
		setProperty('point.scale.y', 0.8)
		startTween('pointscale', 'point.scale', {x = 1, y = 1}, 0.3, {ease = 'backOut'})
	end




	if getProperty('mei.y') + 200 < getProperty('ground.y') then
		setProperty('mei.y', 0)
	end

	if getProperty('mei.y') + 220 > getProperty('ground.y') + getProperty('ground.height') then
		setProperty('mei.y', getProperty('ground.y') + getProperty('ground.height') - 220)
	end

	if getProperty('mei.x') + 100 < getProperty('ground.x') then
		setProperty('mei.x', getProperty('ground.x') - 100)
	end

	if getProperty('mei.x') + 150 > getProperty('ground.x') + getProperty('ground.width') then
		setProperty('mei.x', getProperty('ground.x') + getProperty('ground.width') - 150)
	end



	doTweenX('camGameX', 'camGame', (getProperty('mei.x') - 800) * -0.5, 2, 'circOut')
	doTweenY('camGameY', 'camGame', (getProperty('mei.y') - 500) * -0.5, 2, 'circOut')

	if keyboardJustPressed('R') then
		restartSong()
	end

	if keyboardJustPressed('SHIFT') and canDash then
		playSound('dash')
		canDash = false
		playerSpeed = 25

		if directionY ~= '' then
		setProperty('mei.scale.y', 1.3)
		setProperty('mei.scale.x', 0.7)
		end

		if directionX ~= '' then
		setProperty('mei.scale.x', 1.3)
		setProperty('mei.scale.y', 0.7)
		end

		startTween('meiscale', 'mei.scale', {x = 1, y = 1}, 0.3, {ease = 'circOut'})

		callMethod('mei.setColorTransform', {0, 0, 0, 1, 255, 255, 255, 0})
		runTimer('dashCooldown', 0.1)
	end

	if keyboardPressed('S') then -- MOVE DOWN

		if directionY ~= 'down' then
			directionY = 'down'
		end

		cancelTween('meiye')
		runTimer('meiyd', 0.03)
		doTweenY('meiy', 'mei', getProperty('mei.y') + playerSpeed, 0.01)

	end

	if keyboardPressed('W') then -- MOVE UP

		if directionY ~= 'up' then
			directionY = 'up'
		end

		cancelTween('meiye')
		runTimer('meiyu', 0.03)
		doTweenY('meiy', 'mei', getProperty('mei.y') - playerSpeed, 0.01)

	end

	if keyboardPressed('D') then -- RIGHT

		if directionX ~= 'right' then
			directionX = 'right'
		end

		setProperty('mei.flipX', true)
		cancelTween('meiye')
		runTimer('meiyr', 0.03)
		doTweenX('meix', 'mei', getProperty('mei.x') + playerSpeed, 0.01)

	end

	if keyboardPressed('A') then

		if directionX ~= 'left' then
			directionX = 'left'
		end

		setProperty('mei.flipX', false)
		cancelTween('meiye')
		runTimer('meiyl', 0.03)
		doTweenX('meix', 'mei', getProperty('mei.x') - playerSpeed, 0.01)

	end


	if not keyboardPressed('A') and not keyboardPressed('D') then
		directionX = ''
	end

	if not keyboardPressed('W') and not keyboardPressed('S') then
		directionY = ''
	end


	if mouseClicked('left') then
		onBasicAtk(normal)
	end

	if getMouseX('hud') > getProperty('ball.x') - 30 and getMouseX('hud') < getProperty('ball.x') + 100 then
		if getMouseY('hud') > getProperty('ball.y') - 30 and getMouseY('hud') < getProperty('ball.y') + 100 then
			if mouseClicked('left') and canMultiply then
				canMultiply = false
				playSound('fireball')
				onBasicAtk(multiply)
				callMethod('ball.setColorTransform', {0, 0, 0, 1, 255, 255, 255, 0})
				setProperty('ball.scale.x', 1.4)
				setProperty('ball.scale.y', 1.4)
				startTween('ballscale', 'ball.scale', {x = 1, y = 1}, 0.5, {ease = 'circOut'})
			end
		end
	end

	if mouseClicked('right') and canBall then
		playSound('ball')
		canMultiply = true
		canBall = false
		runTimer('canBall', 0.82)
		callMethod('ball.setColorTransform', {1, 1, 1, 1, 0, 0, 0, 0})
		screenCenter('ball', 'x')
		setProperty('ball.y', 700)
		setProperty('ball.alpha', 1)
		doTweenY('bally1', 'ball', getRandomInt(10, 400), 0.5, 'circOut')
		doTweenX('ballx1', 'ball', getRandomInt(300, 900), 0.8, 'circOut')
	end
end



function onTimerCompleted(tag)

	if tag == 'dashCooldown' then
		callMethod('mei.setColorTransform', {1, 1, 1, 1, 0, 0, 0, 0})
		playerSpeed = 7
		runTimer('canDash', 0.2)
	end

	if tag == 'canBall' then
		canBall = true
	end

	if tag == 'canDash' then
		canDash = true
	end

	if tag == 'meiyd' then
		doTweenY('meiye', 'mei', getProperty('mei.y') + (playerSpeed * 4), 0.5, 'circOut')
	end

	if tag == 'meiyu' then
		doTweenY('meiye', 'mei', getProperty('mei.y') - (playerSpeed * 4), 0.5, 'circOut')
	end

	if tag == 'meiyr' then
		doTweenX('meiye', 'mei', getProperty('mei.x') + (playerSpeed * 4), 0.5, 'circOut')
	end

	if tag == 'meiyl' then
		doTweenX('meiye', 'mei', getProperty('mei.x') - (playerSpeed * 4), 0.5, 'circOut')
	end
end





function onTweenCompleted(tag)

	if tag == 'bally1' then
		doTweenY('bally2', 'ball', getProperty('ball.y') + 50, 0.3, 'circIn')
		doTweenAlpha('balla2', 'ball', 0, 0.3, 'circOut')
	end

	if tag == 'ballsa' then
		doTweenAngle('ballsa', 'balls', getProperty('balls.angle') + 90, 1)
	end

	if tag == 'balla' then
		doTweenAngle('balla', 'ball', getProperty('ball.angle') + 90, 1)
	end

	if tag == 'pointa' then
		doTweenAngle('pointa', 'point', getProperty('point.angle') + 90, 0.6, 'backOut')
	end

	if tag == 'meix1' then
		doTweenX('meix2', 'mei.scale', 1, 0.2, 'sineInOut')
	end

	if tag == 'meiy1' then
		doTweenY('meiy2', 'mei.scale', 1, 0.3, 'sineInOut')
	end

	if tag == 'meix2' then
		doTweenX('meix1', 'mei.scale', 0.95, 0.2, 'sineInOut')
	end

	if tag == 'meiy2' then
		doTweenY('meiy1', 'mei.scale', 1.05, 0.3, 'sineInOut')
	end
end



function onBasicAtk(type)

setProperty('atk.y', (getProperty('mei.y') + 120) - (getProperty('atk.width') / 2))
setProperty('atk.x', (getProperty('mei.x') + 120) - (getProperty('atk.width') / 2))


if directionY ~= '' then
	setProperty('atk.angle', 0)

	if directionY == 'down' then
		setProperty('atk.y', (getProperty('mei.y') + 120) - (getProperty('atk.width') / 2) + 160)
	end

	if directionY == 'up' then
		setProperty('atk.y', (getProperty('mei.y') + 120) - (getProperty('atk.width') / 2) - 160)
	end
end


if directionX ~= '' then
	setProperty('atk.angle', 90)

	if directionX == 'left' then
		setProperty('atk.x', (getProperty('mei.x') + 120) - (getProperty('atk.width') / 2) - 160)
	end

	if directionX == 'right' then
		setProperty('atk.x', (getProperty('mei.x') + 120) - (getProperty('atk.width') / 2) + 160)
	end
end

	

	setProperty('atk.alpha', 1)
	doTweenAlpha('atka', 'atk', 0, 0.3)
end