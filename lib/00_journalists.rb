# Méthode qui donne la réponse à : Combien d'handle contiennent un numéro ?
def w_number (array)
  # array.selected -> créer un nouveau tableau avec les items qui ont vérifié la condition "item.match?(/[0-9]/)" == true
  restult_number = array.select {|item| item.match?(/[0-9]/)} # item.match?(/[0-9]/) permet de renvoyer true si il y a un nombre entre 0 et 9 dans la chaine de caractère
  return restult_number.length
end

# Méthode qui donne la réponse à : Combien d'handle contiennent les 4 lettres du prénom "Aude" à la suite (sans prendre en compte les majuscules) ? 
def w_aude (array)
  result_aude = array.select {|item| item.downcase.match?("aude")}
  return result_aude.length
end

# Méthode qui donne la réponse à : Combien commencent par une majuscule (première lettre juste après le @) ?
def start_w_capital (array)
  second_letter = []

  array.each do |item|
    second_letter << item[1]
  end

  result_capital_after = second_letter.select {|item| item.match?(/[A-Z]/)}

  return result_capital_after.length
end

# Méthode qui donne la réponse à : Combien contiennent au moins une majuscule ?
def w_capital (array)
  result_capital = array.select {|item| item.match?(/[A-Z]/)}
  return result_capital.length
end

# Méthode qui donne la réponse à : Combien y a-t-il de underscore _ dans tous les pseudos confondus ?
def w_underscore (array)
  nb_underscore = 0
  sum = 0
  array.each do |item| 
    nb_underscore = item.count "_"
    sum += nb_underscore
  end
  return sum
end

# Méthode qui :  Trie la liste de handle par ordre alphabétique.
def order_tab (array)
  order_tab = array.sort{|a,b| a.upcase <=> b.upcase} 
  return order_tab
end

# Méthode qui donne la réponse à : Quels sont les 50 handles les plus courts de ce array ?
def fifty_short_item (array)
  order_length_tab = array.sort{|a,b| a.length <=> b.length}

  inf_50_handle = []

  50.times do |i|
   inf_50_handle << order_length_tab[i]
  end
  return inf_50_handle
end

# Méthode qui donne la réponse à : Quelle est la position dans l'array de la personne @epenser ?
def epenser_position (array)
  i = 0
  array.each do |item|
    if item.include?("@epenser")
      break
    end
    i += 1
  end
  return i 
end

# Méthode qui permet d'afficher une interface utilisateur pour répondre aux questions
def user_screen (journalist_log)
  # On dit bonjour à l'utilisateur car on est poli.
  puts "Bienvenu dans notre super outils d'analyse de data !"
  puts ""
  # On ititialise la condition de notre boucle
  user_choise = "0"
  # On démarre la boucle
  while user_choise != "q"
    # On affiche les possibilités à l'utilisateur
    puts "Pour choisir une fonctionnalité choisir un numéro (pour quittr ce sublime programme appuyer taper q): "
    puts "1) Nombre de journaliste"
    puts "2) Nombre d'handle avec un numéro"
    puts "3) Nombre d'handle avec 'aude' " 
    puts "4) Nombre d'handle qui commencent par une majuscule"
    puts "5) Nombre d'handle qui contiennent une majuscule"
    puts "6) Nombre d'handle avec un _ (underscore)"
    puts "7) Trier et afficher la liste de handle par ordre alphabétique"
    puts "8) Afficher les 50 handles les plus courts de ce tableau"
    puts "9) Quelle est la position de la personne @epenser dans le tableau"
    puts ""
    # On demande une entré à l'utilisateur (nombre entre 1 et 9 ou q pour quitter le programme)
    print ">"
    user_choise = gets.chomp
    # Pour chaques valeurs on associe une fonctionnalité correspondante (voir méthodes précédentes) et on écrit une petite phrase pour mettre en forme la donnée affichée
    case user_choise
    when "1"
      puts "Il y a #{journalist_log.length} dans cette array."
    when "2"
      puts "Il y a #{w_number(journalist_log)} handles qui contiennent un numéro."
    when "3"
      puts "Il y a #{w_aude(journalist_log)} handles qui contiennent les 4 premières lettres du prénom 'Aude' à la suite."
    when "4"
      puts "Il y a #{start_w_capital(journalist_log)} handles qui commencent par une majuscule."
    when "5"
      puts "Il y a #{w_capital(journalist_log)} handles qui contiennent une majuscule."
    when "6"
      puts "Il y a #{w_underscore(journalist_log)} handles avec un _ (underscore)."
    when "7"
      puts "Voici la liste des handles dans l'ordre alphabétique : "
      puts "#{order_tab(journalist_log)}"
    when "8"
      puts "Voici la liste des 50 plus couts handles de ce array."
      puts "#{fifty_short_item(journalist_log)}"
    when "9" 
      puts "La personne @epenser est en #{epenser_position(journalist_log)} position dans le tableau" 
    else
    end
    puts ""
  end
end


def perform 
  # On initialise le tableau
  journalist_log = ["@jcunniet","@PaulLampon","@Aziliz31","@ssoumier","@marionsouzeau","@gaellombart","@bendarag","@AurelieLebelle","@julienduffe","@thomaspoupeau","@LilyRossignol","@ClairGuedon","@stephanieauguy","@claw_prolongeau","@_JulieMenard","@LColcomb","@Zlauwereys","@MeLonguet","@DorotheeLN","@NolwennCosson","@ADaboval","@Remibaldy","@bderveaux","@amandechap","@ELODIESOULIE","@nbongarcon","@HeloAb","@Panamorama","@gregplou","@BenoitBerthe","@LauraBruneau89","@Anthony_Lieures","@Sharonwaj","@mcsonkin","@pverduzier","@emiliel3","@Julien_MARION","@SophiFay","@bdelombre","@annalecerf","@AdriaBudry","@DejNikolic","@iJaffre","@CyrusleVirus","@GPardigon","@e_vallerey","@IsabelleSouquet","@AudeDavidRossi","@Yoann_Pa","@CeliaPenavaire","@perraultvincent","@cboulate","@JustineWeyl","@Paulinejacot","@juliechab","@aslechevallier","@phnou","@Seb_Pommier","@Alex_Bensaid","@GuillaumeGaven","@annelaurechouin","@Oliviader","@guerricp","@JMMarchaut","@cyceron","@gregory_raymond","@vhunsinger","@l_peillon","@fannyguinochet","@EAssayag","@KibweAdom","@YvonHerry","@JohanGarciajg","@saidlabidi","@lauranneprov","@LeaDavy","@francois_remy","@CGuicheteau","@FloMaillet","@m_perroud","@oBrunet_TSMF","@MoonVdc","@jc2taille","@NellyMoussu","@VirginK","@b_misa","@FabriceCouste","@barbara_prose","@lelia2m","@brunoaskenazi","@laurenechamp","@ysisbox","@juliengagliardi","@PierreLel","@kdeniau","@_TerraInc","@DominicArpin","@antoinfonteneau","@nanotousch","@jb_roch","@YaniKhezzar","@Anne_Bechet","@NCapart","@SamyBenNaceur","@Joumany","@Julietteraynal","@TGiraudet","@SaraTanit","@HappeFrederic","@antoinellorca","@michelpicot","@Sev_Ryne","@bobdobolino","@murdever","@YGrandmontagne","@Mnyo","@EdKOSCIANSKI","@tnoisette","@jankari","@delbello_rom","@rflechaux","@NadiaSorelli","@IT_Digital","@abarbaux","@PhilippeLeroy","@schaptal","@marionspee","@lisavignoli","@ChloeAeberhardt","@MartineJacot","@JuliaPascualita","@curieusedetout","@sgraveleau","@bif_o","@ElisaPineau","@zinebdryef","@apiquard","@pierrehaski","@StephanieDelmas","@Blandine_Garot","@vergara_i","@evan_lebastard","@SophieVclt","@OlivierLevrault","@alicedorgeval","@LouiseMalnoy","@alix_fx","@pierre_baudis","@LucMagoutier","@AgatheMuller","@SGianninelli","@PaulineBoyer33","@NaomiHalll","@romaindlx","@marionbr","@Burtschy","@JacobEtienne","@as_lizzani","@marie_simon","@LaureDaussy","@FabriceAmedeo","@LoubnaChlaikhy","@PlummerWilliam","@OlivierMarin1","@alaurefremont","@mwesfreid","@ChBaDe","@pmathon","@theobaldmarie","@Lnpagesy","@marclandre","@paoliniesther","@Feertchak","@JBLitzler","@GuillaumeErrard","@quentinperinel","@TristanQM","@mlbo","@constancejamet","@LoraTerrazas","@emiliegeffray","@Mathilde_Sd","@CaroPiquet","@DCanivez","@TIM_7375","@blandinelc","@ivanrioufol","@arthurberdah","@SarahLecoeuvre","@guillaume_gui","@DamienMercereau","@W_Chloe","@Assma_MD","@EugenieBastie","@HiTech_lexpress","@bcondominas","@Laurie_Z_","@jeanfrancgerard","@MathieuPagura","@BGUYF","@AlainPiffaretti","@AudreyKucinskas","@julienhory","@Pierrefalga","@TiphThuillier","@cdaniez","@LigerBaptiste","@D_Peras","@julie_dlb","@Fatiha_Temmouri","@julian2lamancha","@GaetaneDeljurie","@JulianMattei","@M_Vicuna","@DeBruynOlivier","@Nehed_Jendoubi","@antoine_grenapi","@ColonnaGen","@VictoriaGairin","@Clement_Lacombe","@TVigoureux","@MargauxObriot","@solinedelos","@RocheSabine","@dangerkens","@EdouardDutour","@MDondeyne","@DupuisNathalie1","@bouscarel","@Mathieu2jean","@Sophie_T_J","@laurentcalixte","@patrockwilliams","@PascaleKremer","@AlexJaquin","@LauraIsaaz","@cath_robin","@Del_Gautherin","@Isaduriez","@lucietuile","@AugeyBastien","@mcastagnet","@AminaKalache","@mvaudano","@CParrot","@ombelinetips","@_JoinLion","@BarbolosiRose","@ToiBruno1","@FloraClodic","@xjbdx","@AlexiaEy","@Emjy_STARK","@elcoco01","@rabilebon","@pflovens_","@FabriceFrossard","@MorganeSERRES","@MarjolaineKoch","@edgarsnow","@SRNLF","@CChassigneux","@KerinecMoran","@NassiraELM","@NewsRicard","@Sandreene","@Emilezrt","@Pierre_Do","@Micode","@CColumelli","@DavidAbiker","@ClementBergantz","@benjaminrabier","@celinekallmann","@edwyplenel","@C_Barbier","@JJBourdin_RMC","@LaurenceFerrari","@aslapix","@IsaMillet","@MaximeSwitek","@tomjoubert","@jszanchi","@roqueeva","@XavierBiseul","@florencesantrot","@AntoineCrochet","@freeman59","@MaudeML","@philippe_gulpi","@mathieum76","@kiouari","@imanemoustakir","@BenedicteMallet","@Emilie_Brouze","@antoinebarret","@_nicolasbocquet","@remibuhagiar","@CourretB","@AymericRobert","@miraelmartins","@pmaniere","@jesuisraphk","@David_Ingram","@pcelerier","@technomedia","@Geraldinedauver","@ThierryLabro","@Newsdusud","@nrauline","@gbregeras","@SCouasnonBFM","@actualites_nrv","@dimitrimoulins","@oli_aura","@FabieChiche","@Vincent_Raimblt","@ChristophGreuet","@PAlbuchay","@MarrauddesGrot","@vtalmon","@cedric","@olivierfrigara","@Julien_Jay","@LydiaBerroyer","@Shuua","@datisdaz","@Steuph","@ameliecharnay","@Bruno_LesNums","@LelloucheNico","@CciliaDiQuinzio","@Elodie_C","@SylvRolland","@Kocobe","@FL_Debes","@jdupontcalbo","@GarciaVictor_","@NicoRichaud","@RHoueix","@simottel","@DamienLicata","@annabelle_L","@Lea_Lejeune","@axel_deb","@marin_eben","@ptiberry","@MatthieuDelach","@sandrinecassini","@benjaminferran","@ppgarcia75","@NotPatrick","@ivalerio","@FabienneSchmitt","@alexgoude","@JeromeColombain","@manhack","@Capucine_Cousin","@Fsorel","@oliviertesquet","@marjoriepaillon","@ginades","@PierreTran","@DelphineCuny","@reesmarc","@lauratenoudji","@ldupin","@carolinedescham","@Lucile_Quillet","@cgabizon","@Allocab","@epenser","@JAGventeprivee","@frwrds","@Laure__Bourdon","@Xavier75","@maximeverner","@s_jourdain","@LoriHelloc"]
  # On charge l'écran d'acceuil pour l'utulisateur de notre super logiciel
  user_screen(journalist_log)
end

perform