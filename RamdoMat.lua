-- ==============================================================================
-- EVA LAB SIMULATION UPDATE
-- ==============================================================================

local genres = {
    "THIRD IMPACT CORE", "QLF CLOUD / COGNACOISE", "NEO-TOKYO 3 DRILL", "DEEP CYBER SIMULATION", 
    "MUGEN TSUKUYOMI AMBIENT", "SHINOBI PHONK", "ZION UNDERGROUND", "LOGE NOIRE DEEP TRAP", 
    "X-FILES SYNTH PHONK", "91'S WAVE", "BLUE ROSE AMBIENT", "PARANORMAL DRILL", "OWL CAVE INDUSTRIAL",
    "GARM_ONIZUKA SHITAPOST", "LCL OVERDRIVE BREAKCORE", "AKATSUKI TRAP METAL", "BLACK OIL GLITCH HOP",
    "DEEP THROAT EXPERIMENTAL", "AGENT SMITH HARDCORE", "LAURA PALMER PHONK CHOP", "RED ROOM DOOM BEAT",
    "SHINRA TENSEI SUB-LOW", "SENNIN MODE LO-FI GAGE", "CONSTRUCT BREAKBEAT SIM", "政府 RECONSTRUCTION NOISE"
}

local bpms = {91, 107, 120, 133, 135, 140, 142, 150, 160, 172, 185}

local samples = {
    -- Evangelion
    "808 ANGEL ATTACK SUB", "ALERTE NERV RED SIREN", "REI AYANAMI VOCAL MONOLOGUE", "MAGI SYSTEM DATA NOISE",
    "EVA-01 BERSERK SCREAM", "LCL FLUID BUBBLES", "CHAMP AT DISRUPTION", "ADAM EMBRYO CLICK",
    "LANCE DE LONGIN SWOOSH", "KAWORU PIANO CHORD", "TOKYO-3 DESTRUCTION RUMBLE", "ASUKA 'ANTA BAKA' LOFI", 
    "SEELE MONOLITH HUM", "NERV COMPUTER BEEP", "ENTRY PLUG INJECTION",
    -- PNL
    "VOCAL AD-LIB MOWGLI DIST", "WHISTLE PNL REVERSE", "CORNET DE GLACE SOMBRE", "PAD SYNTHE 'DA'",
    "BEEP IPHONE 91", "BRUIT DE DOIZ", "LASER 'ONIZUKA'", "CLICK RECHARGE COGNACOISE",
    "VOCAL 'CHICO' GATED", "DRONE 'LE MONDE OU RIEN'", "FX AMBIENT MELT BANLIEUE", "LOFI CHILL 'DLL' KEYS",
    "SNARE 91'S CLAP", "CHILL TRAP RIMSHOT", "SUB 'JUSQU'AU DERNIER GRAMME'",
    -- Naruto
    "AMATERASU GLITCH FIRE", "CHIDORI SPARKS TEXTURE", "FLUTE SHINOBI TOXIQUE", "SUKUIZENSEN KOTO EXTRACT",
    "SHINRA TENSEI SUB DROP", "KATON BOULE DE FEU FX", "RASENGAN ORB SWIRL", "MARQUE MAUDITE HISS",
    "KUCHIYOSE INVOCATION SMOKE", "KUNAI CLASH METAL", "SHARINGAN SPIN SFX", "SAND TSUNAMI CRUSH",
    "AKATSUKI BELL CHIME", "BYAKUGAN VEINS PULSE", "EDO TENSEI COFFIN OPEN",
    -- Matrix
    "WHITE RABBIT CLICK NOISE", "DECONSTRUCTED PHONE RING", "METAMORPHOSIS CODE MATRIX", "EMP WAVE CRASH",
    "NEO BULLET TIME SLOWDOWN", "SENTINEL METAL CLAWS", "ZION DANCE DRUM BREAK", "AGENT SMITH LAUGH CHOP",
    "SWITCHBOARD TERMINAL FX", "RED PILL DROP", "32-BIT DIGITAL NOISE", "VINTAGE AKAI S950 CHOP", 
    "SP-1200 VINYL CRACKLE", "SUB-BASS MATRIX SIM", "MATRIX DIGITAL RAIN DROP",
    -- Twin Peaks
    "TWIN PEAKS REVERSE DANCE VOCAL", "LAURA PALMER SCREAM ECHO", "BOB EVIL LAUGH CHOP", "COOPER CAFE POURING FX",
    "LOGE NOIRE REVERB PAD", "CHOUETTE OWL CRY REVERB", "VINTAGE RHODES DISTORTED", "SNARE JAZZ BRUSH LOOP",
    "BLUE ROSE DETUNED SYNTH", "ONE-ARMED MAN WHISPER", "GIANT 'IT IS HAPPENING AGAIN'", "DEEP WOODS GHOST DRONE",
    "GRAMOPHONE SCRATCH 1920", "AUDREY'S DANCE PLUCK", "DOUGLAS FIR LEAF RUSTLE", "COOPER TAPE RECORDER CLICK",
    "WINDOM EARLE FLUTE", "FIRE WALK WITH ME SUB-BOOM", "SNARE JAZZ RIM DETUNED", "LOG LADY MYSTERY TEXTURE",
    -- X-Files
    "X-FILES WHISTLE MARK SNOW DELAY", "MULDER RECORDING TAPE REVERSE", "ALIEN ABDUCTION BEAM", "UFO RADAR SONAR BLIP",
    "GOUV PARANORMAL WHISPER", "CIGARETTE SMOKING MAN LIGHTER", "FLASHLIGHT CLICK SWITCH", "SILENT WOODS AMBIENCE",
    "SUB-LOW PARANORMAL BOOM", "TELEVISION STATIC NOISE", "VHS TRACKING GLITCH BASS", "MUTATION CELLULAR CLICK",
    "ARECIBO JODRELL BANK SIGNAL", "KRYCEK TREACHERY CLAP", "SKINNER GRAVE SUB BASS", "BLACK OIL METALLIC DRIP",
    "PUNCHY RECONSTRUCTION TAPE", "AUTOPSY SURGICAL SCALPEL FX", "COAXIAL CABLE INTERFERENCE", "UNSOLVED MYSTERY GLITCH TONE"
}

local vsts = {
    "JS: LCL Fluid Saturation", "JS: MAGI Bipolar Filter", "JS: AT_FIELD Dynamic Expander", "JS: MIDI Sequencer Megababy",
    "JS: Saike / Amaranth", "JS: JoepVanlier / Final Boss", "JS: Tukan / Green Circles", "JS: Saike / SatanVerb",
    "VST: dblue Glitch v1.3 (Classic)", "VST: CamelCrusher (Distortion)", "VST: mda TalkBox (Legacy)", "VST: iZotope Vinyl",
    "VST: Mark Snow 1993 Whistle Delay", "VST: Synclavier II Paranormal Resonator", "VST: Red Room Reverse Gated Reverb", 
    "VST: Ensoniq ASR-10 Laura Palmer Chopper", "VST: Owl Cave Haunted Spring", "VST: Black Oil Phase Liquid", 
    "VST: Lone Gunmen Crypto-Bitcrusher", "VST: FBI Evidence Tape Saturation", "JS: Twin Peaks Jazz Room Compressor"
}

local inspirations = {
    -- Evangelion
    "MODE BERSERK ACTIVÉ.", "SYNCHRO 400% ATTEINTE.", "PILOTE L'EVA.", "NE FUIS PAS DEVANT LE DESTIN.", "CHAMP AT DÉPLOYÉ.",
    "PROJET DE COMPLÉMENTATION LANCE.", "L'HUMAIN EST FAIT DE SOUFFRANCE.", "L'ART NAÎT DU CHAOS NERV.", "MAGI : SYSTEME COMPATIBLE.",
    "L'IMPACT VISUEL EST IMMINENT.", "PROJET EVANGELION V2.", "REI EN PLEINE SIMULATION.", "ASUKA BRLE LES PISTES.",
    "L'ANGE ATTAQUE LE SEQUENCEUR.", "SOUS LE FLUIDE LCL.", "DANS LE COCKPIT DE L'EVA-01.", "LA COMPLEMENTATION COMMENCE.",
    "APOCALYPSE DANS LE TAMPON.", "COEURS BRISÉS DANS LA NERV.", "GEHIRN LAB : CODE ROUGE.", "LE S2 ENGINE EST CHARGÉ.",
    "EVANGELION REBORN.", "LE SANG DE LILIH BRLE.", "TOKYO-3 EST EN RUINE.", "SOUFFRANCE DU QUATRIEME ANGE.",
    "L'AME DANS LA MACHINE.", "NE TE JETTE PAS DANS LE VIDE.", "DÉSTRUCTION FINALE ACTIVÉE.", "MAGI EN MODE BIPOLAIRE.",
    "PROXIMITÉ DE l'IMPACT EXTATS.", "PILOTE TA PROPRE VIE.", "L'ANGE DU SEIZE EST ICI.", "LUNE NOIRE DÉPLOYÉE.",
    "PAS DE DIEU DANS CE LABO.", "LANCE DE LONGIN IMMORTELLE.", "SOUVENIRS DE LA PREMIÈRE COMPOSITION.", "DÉCOR DU DESIGN CYBER.",
    "LE SYSTÈME CRASH EN MODE NERV.",
    -- PNL
    "QUE LA FAMILLE DANS LA SIMULATION.", "LE MONDE CHICO.", "OU ALORS RIEN DU TOUT.", "JUSQU'AU DERNIER GRAMME.",
    "PLUS QLF QUE LES QLF.", "LE COEUR EST GLACÉ.", "PAS DU TOUT COMME EUX.", "BÂTIMENT DANS LE RAP.", "JE VOIS LES ANGES S'AGITER.",
    "MOWGLI QUITTE LA JUNGLE.", "ONIZUKA EN MODE STUDIO.", "SUR LE CORNET DE GLACE.", "DANS LA SOUPE DE BANLIEUE.",
    "DLL ACTIVE DANS LA MATRICE.", "91 DANS LE SEQUENCEUR.", "BENE PREND LES COMMANDES.", "AMIGO PASSE LE MIX.",
    "L'AMOUR OU LA HAINE AU MASTER.", "LE MONDE OU RIEN.", "J'CONNAIS LA RUE ET LES FX.", "MON DIEU FAUT QUE J'LEVITE.",
    "DANS LA ZONE SANS RETOUR.", "LES ANGES CRASHENT LE BEAT.", "QLF TOUJOURS EN LIGNE.", "JUSQU'A LA DERNIERE GOUTTE.",
    "RIEN NE CHANGE AU BÂTIMENT.", "LE FLUX EST GLACÉ.", "ON PREND TOUT ON RESTE LA.", "LA TRAP DE L'ENFER.",
    "DANS LE VIDE DU CORNET.", "LA VIE EST SOMBRE CHICO.", "LA FAMILLE COMPTE EN PREMIER.", "LE DROZ FAIT PAS DE CADEAU.",
    "PAS DU TOUT COMME LA MACHINE.", "SEUL DANS LE HALL DU BEAT.", "J'REVOIS LES ANGES TOURNER.", "LE SCRIPT DU BÂTIMENT C.",
    -- Naruto
    "ÉVEIL DU SHARINGAN IMMINENT.", "SHINRA TENSEI ACTIVÉ.", "MUGEN TSUKUYOMI DU PROJET.", "JE NE REVIENS JAMAIS SUR MA PAROLE.",
    "KOTOAMATSUKAMI DU MIX.", "FEU DE LA VOLONTÉ D'KONOHA.", "SAGE DES SIX CHEMINS DU BEAT.", "CHIDORI DANS LE MASTER.",
    "EDO TENSEI DES CLASSIQUES.", "RASENSHURIKEN COUPE LES FREQUENCES.", "AMATERASU SUR LE SCRIPT.", "AKATSUKI EN EMBUSCADE.",
    "SENNIN MODE ENCLENCHÉ.", "LES PORTES DE LA DOULEUR.", "SHINOBI PHONK IMPACT.", "KUNAI DANS LE SEQUENCEUR.",
    "LE SANG DES UCHIHA.", "SUSANO'O PROTEGE LE MASTER.", "TSUKUYOMI INVERSE.", "LA MARQUE MAUDITE BRLE.",
    "SENSEI DU SOUND DESIGN.", "DANS LES LARMES DU SHINOBI.", "LE DESTIN D'UN NINJA.", "KONOHA EN FLAMMES.",
    "OROCHIMARU S'INJECTE.", "LE PLAN OEIL DE LUNE.", "L'ERE DES SHINOBIS DU BEAT.", "GAARA DANS LA MATRICE.",
    "REVOLUTION DU PROJET NINJA.", "LE SCELLAGE EST PRÊT.", "L'INANITION DE KYUUBI.", "ENTRAÎNEMENT SENNIN INTENSE.",
    "LE POING DU SHINOBI.", "TRAHISON DE L'AKATSUKI.", "SACRIFICE DU TROISIEME SAGE.", "LA VOIE DU NINJA CRÉATIF.",
    "LES YEUX DE LA HAINE.",
    -- Matrix
    "CHOISIS LA PILULE ROUGE.", "IL N'Y A PAS DE CUILLÈRE.", "LIBÈRE TON ESPRIT.", "VOL AU-DESSUS DE ZION.",
    "SUIS LE LAPIN BLANC.", "JE CONNAIS LE SOUND DESIGN.", "DÉCONNEXION DE LA MATRICE.", "AGENT SMITH EN APPROCHE.",
    "DUPLIQUE TES PISTES.", "ZION RESTE ÉVEILLÉ.", "LA SIMULATION REPREND.", "DANS L'INTELLIGENCE ARTIFICIELLE.",
    "DÉUS EX MACHINA AU MASTER.", "CONSTRUCT DE TA PROPRE CRÉATIVITÉ.", "ÉCHAPPE AUX SENTINELLES.", "CODE VERT DANS LE BUFFER.",
    "NEBUCHADNEZZAR EN ATTERRISSAGE.", "LE CODE SOURCE REECRIT.", "MATRIX GLITCH TOTAL.",
    -- Twin Peaks
    "LES HIBOUX NE SONT PAS CE QUE L'ON PENSE.", "DIANE, J'INJECTE UN NOUVEAU BEAT.", "RENDEZ-VOUS DANS LA LOGE NOIRE.", 
    "CE FEU MARCHE AVEC MOI AU MASTER.", "CAFÉ NOIR ET TARTE AUX CERISES EN RÉGIE.", "LAURA PALMER S'EST ENFUIE DU MIX.", 
    "LE GÉANT TE PARLE EN CODE MIDI.", "LE NAIN DANSE À L'ENVERS SUR LA TIMELINE.", "PROJET BLUE BOOK DANS LE BUFFER.", 
    "TROUVE LA ROSE BLEUE DU SOUND DESIGN.", "WINDOM EARLE COMPLAÎT TON MIX.", "LOG LADY COMPREND LA SÉQUENCE.", 
    "L'HÔTEL COOPÈRE WITH THE PROD.", "SOUVENIRS ENGLOUTIS À REAL ROOM.", "BOB CAPTURE TON ENVELOPE ADSR.", 
    "LA GAGNE DE SHERIFF DANS LA MATRICE.", "PHILIP JEFFRIES EN MODE VAPORWAVE.", "JUDY NE SERA PAS DU MASTER.", 
    "UNE SÉQUENCE JAZZ SOMBRE DANS LES BOIS.", "SIGH DE LAURA PALMER AU REVERB.",
    -- X-Files
    "LA VÉRITÉ EST AILLEURS DANS LE SÉQUENCEUR.", "NE FAIS CONFIANCE À PERSONNE AU MASTER.", "MULDER EN PLEIN SYNDICAT DU BEAT.",
    "DOSSIER CLASSIFIÉ X-FILE ACTIVÉ.", "SCULLY ANALYSE LA FRÉQUENCE DU GLITCH.", "L'HOMME À LA CIGARETTE COUPE LE GAIN.",
    "ABDUCTION NUMÉRIQUE 32-BIT.", "RETOUR DU SIGNAL PARANORMAL COAXIAL.", "I WANT TO BELIEVE EN TON MIX.", 
    "DEEP THROAT NE BALANCERA PAS LE TEMPO.", "ALERTE VIRUS EXTRATERRESTRE SUR PISTE 1.", "L'HUILE NOIRE INFECTE LE MASTER.", 
    "PROJET RECONSTRUCTION SECRÈTE AD-LIB.", "SATELLITE ESPION SUR TON BUFFER.", "LES LONE GUNMEN DECRYPTENT TON SYNTHÉ.", 
    "LE DIRECTEUR SKINNER SURVEILLE LES LIMITS.", "RAPPORT D'AUTOPSY DE LA BANQUE DE SAMPLE.", "ZONE 51 DANS LE SEQUENCER.", 
"PHÉNOMÈNE DE TRANSCOMMUNICATION AUDIO.", "SIGNAL VENU DE L'ESPACE PROFOND."
}
local themes = {
{r=0.75, g=0.12, b=0.12, name="EVA NERV"},
{r=0.00, g=0.85, b=0.25, name="THE MATRIX"},
{r=0.15, g=0.45, b=0.85, name="X-FILES"},
{r=0.55, g=0.15, b=0.75, name="TWIN PEAKS"}
}
local current_theme_idx = 1
local locks = {false, false, false, false, false}
local values = {"AWAITING RUN...", "AWAITING RUN...", "AWAITING RUN...", "AWAITING RUN...", "AWAITING RUN..."}
local labels = {"CODE // STYLE_GENRE", "CODE // TIMING_BPM", "CODE // SAMPLE_SOURCE", "CODE // PRO_FX_VST", "CODE // PROTOCOLE_INSPIRATION"}
local is_running = false
local run_counter = 0
local last_time = os.clock()
gfx.init("EVA LAB // SELECTION MATRIX", 480, 560, 200, 200)
gfx.setfont(1, "Impact", 22)
gfx.setfont(2, "Courier New", 11)
gfx.setfont(3, "Courier New", 13)
-- Fonction utilitaire pour appliquer des artéfacts textuels lors du glitch
local function apply_glitch_text(str)
if is_running and math.random() > 75 then -- Remplacement par des entiers
local glitch_chars = {"@", "#", "$", "%", "*", "Ø", "X", "!", "?"}
local len = string.len(str)
if len > 3 then
local pos = math.random(1, len)
str = string.sub(str, 1, pos-1) .. glitch_chars[math.random(#glitch_chars)] .. string.sub(str, pos+1)
end
end
return str
end
local function draw_theme_selector(x, y, w, h)
local mouse_inside = (gfx.mouse_x >= x and gfx.mouse_x <= x + w and gfx.mouse_y >= y and gfx.mouse_y <= y + h)
if mouse_inside and gfx.mouse_cap == 1 then
if not theme_click_latched then
current_theme_idx = current_theme_idx + 1
if current_theme_idx > #themes then current_theme_idx = 1 end
theme_click_latched = true
end
end
local t = themes[current_theme_idx]
gfx.set(t.r, t.g, t.b, 1)
gfx.rect(x, y, w, h, 1)
gfx.set(0, 0, 0, 1)
gfx.setfont(2)
gfx.x = x + (w - gfx.measurestr(t.name)) / 2
gfx.y = y + (h - 11) / 2
gfx.drawstr(t.name)
end
local function draw_lock_button(x, y, w, h, idx)
local mouse_inside = (gfx.mouse_x >= x and gfx.mouse_x <= x + w and gfx.mouse_y >= y and gfx.mouse_y <= y + h)
if mouse_inside and gfx.mouse_cap == 1 then
if not mouse_click_latched then
locks[idx] = not locks[idx]
mouse_click_latched = true
end
end
local t = themes[current_theme_idx]
if locks[idx] then
gfx.set(t.r, t.g, t.b, 1)
gfx.rect(x, y, w, h, 1)
gfx.set(1, 1, 1, 1)
else
gfx.set(0.12, 0.06, 0.06, 1)
gfx.rect(x, y, w, h, 1)
gfx.set(t.r, t.g, t.b, 1)
gfx.rect(x, y, w, h, 0)
end
gfx.setfont(2)
gfx.x = x + (w - gfx.measurestr("LOCK")) / 2
gfx.y = y + (h - 11) / 2
gfx.drawstr("LOCK")
end
local function draw_monitor_cell(x, y, w, h, idx, is_glitch)
local t = themes[current_theme_idx]
-- CORRECTION : Remplacement de math.random() décimal par un calcul d'entiers propre
if is_glitch then
if math.random(1, 100) > 40 then
local mult = math.random(2, 5) / 10
gfx.set(t.r * mult, t.g * mult, t.b * mult, 1)
else
gfx.set(0.22, 0.02, 0.02, 1)
end
else
gfx.set(0.08, 0.04, 0.04, 1)
end
gfx.rect(x, y, w, h, 1)
if is_glitch and math.random(1, 100) > 50 then
gfx.set(1, 1, 1, 0.07)
for line_y = y + 2, y + h - 2, 4 do
gfx.line(x, line_y, x + w, line_y)
end
end
if is_glitch and math.random(1, 100) > 70 then
gfx.set(1, 1, 1, 0.6)
else
gfx.set(t.r * 0.4, t.g * 0.4, t.b * 0.4, 1)
end
gfx.rect(x, y, w, h, 0)
gfx.set(t.r, t.g, t.b, 1)
gfx.setfont(2)
gfx.x = x + 10
gfx.y = y + 8
gfx.drawstr(labels[idx])
draw_lock_button(x + w - 45, y + 6, 38, 16, idx)
gfx.set(1, 1, 1, 1)
gfx.setfont(3)
gfx.x = x + 10
gfx.y = y + h - 25
-- CORRECTION : Le jitter horizontal utilise désormais exclusivement des entiers
if is_glitch and math.random(1, 100) > 60 then
gfx.x = gfx.x + math.random(-4, 4)
end
local final_text = apply_glitch_text(tostring(values[idx]))
gfx.drawstr(final_text)
end
local function main()
gfx.set(0.03, 0.01, 0.01, 1)
gfx.rect(0, 0, gfx.w, gfx.h, 1)
local t = themes[current_theme_idx]
if is_running and math.random(1, 100) > 92 then
gfx.set(1, 1, 1, 0.8)
else
gfx.set(t.r, t.g, t.b, 1)
end
gfx.rect(10, 10, gfx.w - 20, gfx.h - 20, 0)
gfx.rect(11, 11, gfx.w - 22, gfx.h - 22, 0)
gfx.set(1, 1, 1, 1)
gfx.setfont(1)
gfx.x = 25
gfx.y = 25
gfx.drawstr("EVA LAB SIMULATION UPDATE")
draw_theme_selector(gfx.w - 115, 25, 90, 22)
gfx.set(t.r, t.g, t.b, 1)
for i = 25, gfx.w - 25, 8 do
gfx.line(i, 60, i + 4, 60)
end
if is_running then
local current_time = os.clock()
if current_time - last_time > 0.07 then
if not locks[1] then values[1] = genres[math.random(#genres)] end
if not locks[2] then values[2] = tostring(bpms[math.random(#bpms)]) .. " BPM" end
if not locks[3] then values[3] = samples[math.random(#samples)] end
if not locks[4] then values[4] = vsts[math.random(#vsts)] end
if not locks[5] then values[5] = inspirations[math.random(#inspirations)] end
run_counter = run_counter + 1
last_time = current_time
if run_counter > 14 then
is_running = false
local bpm_num = tonumber(string.match(values[2], "%d+"))
if bpm_num then
reaper.CSurf_OnTempoChange(bpm_num)
end
end
end
end
local cw = (gfx.w - 52) / 2
draw_monitor_cell(25, 80,  cw, 80, 1, is_running and not locks[1])
draw_monitor_cell(27 + cw, 80,  cw, 80, 2, is_running and not locks[2])
draw_monitor_cell(25, 175, cw, 80, 3, is_running and not locks[3])
draw_monitor_cell(27 + cw, 175, cw, 80, 4, is_running and not locks[4])
draw_monitor_cell(25, 270, gfx.w - 50, 80, 5, is_running and not locks[5])
local btn_y = 380
local btn_h = 60
local mouse_on_trigger = (gfx.mouse_x >= 25 and gfx.mouse_x <= gfx.w - 25 and gfx.mouse_y >= btn_y and gfx.mouse_y <= btn_y + btn_h)
if mouse_on_trigger then
gfx.set(t.r * 1.2, t.g * 1.2, t.b * 1.2, 1)
if gfx.mouse_cap == 1 and not is_running then
if not mouse_click_latched then
is_running = true
run_counter = 0
mouse_click_latched = true
end
end
else
gfx.set(t.r, t.g, t.b, 1)
end
gfx.rect(25, btn_y, gfx.w - 50, btn_h, 1)
gfx.set(1, 1, 1, 0.3)
gfx.rect(25, btn_y, gfx.w - 50, btn_h, 0)
gfx.set(1, 1, 1, 1)
gfx.setfont(1)
local trigger_text = ">>> LANCE LE PROTOCOLE <<<"
gfx.x = 25 + (gfx.w - 50 - gfx.measurestr(trigger_text)) / 2
gfx.y = btn_y + (btn_h - 22) / 2
gfx.drawstr(trigger_text)
if gfx.mouse_cap == 0 then
mouse_click_latched = false
theme_click_latched = false
end
if gfx.getchar() >= 0 then
reaper.defer(main)
end
gfx.update()
end
main()

