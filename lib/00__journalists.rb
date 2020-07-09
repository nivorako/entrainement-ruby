=begin
  Hypothèse: un handle est une chaine de caractères qui commence par le caractère '@'
  Renvoie le nombre de handles dans une liste passée en paramètre. 
=end
def number_of_handels(list)
  c = 0 #compteur du nombre de handles 
  list.each do |element|
    if element.length > 0 && element[0] == '@'
	  c += 1
	end
  end
  return c
end

=begin
  Hypothèse: l'élement minimale d'une liste est celui qui est le plus court.
  Renvoie l'élément minimale de la liste.
=end
def min_element(list)
  min_element = list[0] #element minimal de la liste 
  for i in 1...list.size
    if list[i].length < min_element.length 
	  min_element = list[i]
	end
  end
  return min_element 
end

=begin 
  Hypothèse: Dans le calcul de la taille, on ne prend pas en compte l'arobase(premier caractère).
  Renvoie le nombre de handle de taille 5.
=end 
def number_of_five_caracters_handels(list)
  c = 0 #compteur du nombre de handle contenant 5 caractères, sans compter l'arobase 
  list.each do |element|
    if element[0] == '@' && element.length == 6
	  c += 1
	end
  end
  return c
end

=begin 
  Renvoie le nombre de handle qui commencent par une lettre majuscule, juste après l'arobase.
=end 
def number_of_first_letter_cap_handels(list)
  c = 0 #compteur du nombre de handle commençant pas une lettre majuscule juste après l'arobase
  list.each do |element|
    if element[0] == '@' && element.length > 1 && element[1] == element[1].upcase
      c += 1
    end 	  
  end
  return c
end

=begin
  trie un tableau de manière alphabétique suivant le deuxième caractère (tri croissant) 
  Remarque: l'algorithme de tri utilisé est le tri à bulles    
=end
def ascending_alphabetic_sort(list)
  number_of_passing_by = 0 
  exchange_done = true  
  while exchange_done == true 
    exchange_done = false 
    for i in 0...list.size-1-number_of_passing_by
	  element1 = list[i]
	  element2 = list[i+1]
      if element1.length > 1 && element2.length > 1 && element1[1].upcase > element2[1].upcase
	    #permutation
		aux = list[i]
		list[i] = list[i+1]
		list[i+1] = aux 
		exchange_done = true 
      end
    end
    number_of_passing_by += 1	
  end
end 

=begin
  trie un tableau suivant le nombre de caractères (tri croissant) 
  Remarque: l'algorithme de tri utilisé est le tri à bulles    
=end
def ascending_length_sort(list)
  number_of_passing_by = 0 
  exchange_done = true  
  while exchange_done == true 
    exchange_done = false 
    for i in 0...list.size-1-number_of_passing_by
      if list[i].length > list[i+1].length
	    #permutation
		aux = list[i]
		list[i] = list[i+1]
		list[i+1] = aux 
		exchange_done = true 
      end
    end
    number_of_passing_by += 1	
  end
end 

=begin
  retourne la postion de search (constante égale à "@epenser" dans list si elle existe, -1 sinon.
=end 
def position_in_list(list, search="@epenser")
  for i in 0...list.size 
    if list[i] == search 
      return i
    end
  end
  return -1
end 

=begin 
  Fonction principale, sert à tester les différente méthodes traitant la liste des journalistes, à travers un menu.
=end
def perform(journalists_list) 
  key = -1
  while key != 9  
    #Affichage du menu 
    puts "00__jounralists: Menu"
    #mise en forme à l'aide des espaces au lieu des tabulations ('\t') pour une meilleure visualisation du rendu dans le code en lui meme 
    print "           0- Afficher le tableau de base et sa taille\n
           1- Combien y a-t-il de handle dans cet array ?\n
           2- Quelle est le handle le plus court de cette liste ?\n
           3- Combien y-a-t'il de handle contenant 5 caractères (le @ ne compte pas pour un caractère)\n
           4- Combien commencent par une majuscule (première lettre juste après le @) ?\n
           5- Trie la liste de handle par ordre alphabétique.\n
           6- Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)\n
           7- Quelle est la position dans l'array de la personne @epenser ?\n
           8- Sors-moi une répartition des handle par taille de ces derniers (nombre de handle avec 1 caractère, nombre de handle avec 2 caractères, nombre de handle avec 3 caractères, etc)\n\n
             
           9- Quitter le programme\n\n"
           
    #lecture de la saisie entrante
    puts "Veuillez lire le menu et saisir le numéro correspondant à l'option souhaitée."
    print "> "
    key = gets.chomp.to_i  
    case key
      when 0 #Afficher le tableau de base et sa taille
        #affichage du tableau de base 
        puts "Tableau de base:\n\n#{journalists_list}\n\n"
        puts "----------------------------------------------------------------------------------------------------------------------------------"
        #affichage de la taille du tableau de base 
        puts "Taille du tableau de base = #{journalists_list.size}" #381
        puts "----------------------------------------------------------------------------------------------------------------------------------"
      when 1 #Combien y a-t-il de handle dans cet array ?
        #test de la méthode number_of_handels
        puts "Le nombre de handels est: #{number_of_handels(journalists_list)}." #381
        #On peut vérifier que la précédente méthode retourne le meme résultat que la méthode prédéfinie size. C'est le cas.
        puts "----------------------------------------------------------------------------------------------------------------------------------"
      when 2 #Quelle est le handle le plus court de cette liste ?
        #test de la méthode min_element
        puts "L'element minimal de la liste est: #{min_element(journalists_list)}." #@min
        puts "----------------------------------------------------------------------------------------------------------------------------------"#test de la méthode number_of_five_caracters_handels
      when 3 #Combien y-a-t'il de handle contenant 5 caractères (le @ ne compte pas pour un caractère)
	    #test de la méthode number_of_five_caracters_handels
        puts "Nombre de handles à 5 caractères, sans compter l'arobase: #{number_of_five_caracters_handels(journalists_list)}" #6
        puts "----------------------------------------------------------------------------------------------------------------------------------"
      when 4 #Combien commencent par une majuscule (première lettre juste après le @) ?
        #test de la méthode number_of_first_letter_cap_handels
        puts "Nombre de handles avec comme premier caractère après l'arobase une lettre majuscule: #{number_of_first_letter_cap_handels(journalists_list)}" #213
        puts "----------------------------------------------------------------------------------------------------------------------------------"     
      when 5 #Trie la liste de handle par ordre alphabétique.
        #test de la méthode journalists_list
        ascending_alphabetic_sort(journalists_list) 
        puts "Tableau trié alphabétiquement:\n\n#{journalists_list}\n\n"
        puts "----------------------------------------------------------------------------------------------------------------------------------"      
      when 6 #Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)
        #test de la méthode ascending_length_sort
        ascending_length_sort(journalists_list)
        puts "Maintenant, le tableau est, aussi, trié, suivant un ordre croissant, selon la taille des handles:\n\n#{journalists_list}\n\n"
        #On peut, donc, vérifier que le premier élement est bien celui qui est donné par la méthode min_element. C'est le cas.      
        puts "----------------------------------------------------------------------------------------------------------------------------------"
      when 7 #Quelle est la position dans l'array de la personne @epenser ?
        #test de la méthode position_in_list
        puts "La personne \"@epenser\" est à la position #{position_in_list(journalists_list)} dans l'array." #373
        puts "----------------------------------------------------------------------------------------------------------------------------------"      
      when 8 #Sors-moi une répartition des handle par taille de ces derniers (nombre de handle avec 1 caractère, nombre de handle avec 2 caractères, nombre de handle avec 3 caractères, etc)
	    #test
        puts ""
        puts "----------------------------------------------------------------------------------------------------------------------------------"      
      when 9 #Quitter le programme
	    #sortie du programme avec affichage d'un message d'au revoir 
        print "Au revoir\n"
        puts "----------------------------------------------------------------------------------------------------------------------------------"
      else #key n'est pas un entier dans l'intervalle [0..9]
        print "Erreur: saisie rejetée. Raison: saisie erronée. Conseil: saisir un entier netre 0 et 9 inclus (voir menu)\n"	
        puts "----------------------------------------------------------------------------------------------------------------------------------"  
    end
  end
end 

=begin
  Programme Principal
=end
# liste des logins des journalistes 
journalists_list = ["@jcunniet","@PaulLampon","@Aziliz31","@ssoumier","@marionsouzeau","@gaellombart","@bendarag","@AurelieLebelle","@julienduffe","@thomaspoupeau","@LilyRossignol","@ClairGuedon","@stephanieauguy","@claw_prolongeau","@_JulieMenard","@LColcomb","@Zlauwereys","@MeLonguet","@DorotheeLN","@NolwennCosson","@ADaboval","@Remibaldy","@bderveaux","@amandechap","@ELODIESOULIE","@nbongarcon","@HeloAb","@Panamorama","@gregplou","@BenoitBerthe","@LauraBruneau89","@Anthony_Lieures","@Sharonwaj","@mcsonkin","@pverduzier","@emiliel3","@Julien_MARION","@SophiFay","@bdelombre","@annalecerf","@AdriaBudry","@DejNikolic","@iJaffre","@CyrusleVirus","@GPardigon","@e_vallerey","@IsabelleSouquet","@AudeDavidRossi","@Yoann_Pa","@CeliaPenavaire","@perraultvincent","@cboulate","@JustineWeyl","@Paulinejacot","@juliechab","@aslechevallier","@phnou","@Seb_Pommier","@Alex_Bensaid","@GuillaumeGaven","@annelaurechouin","@Oliviader","@guerricp","@JMMarchaut","@cyceron","@gregory_raymond","@vhunsinger","@l_peillon","@fannyguinochet","@EAssayag","@KibweAdom","@YvonHerry","@JohanGarciajg","@saidlabidi","@lauranneprov","@LeaDavy","@francois_remy","@CGuicheteau","@FloMaillet","@m_perroud","@oBrunet_TSMF","@MoonVdc","@jc2taille","@NellyMoussu","@VirginK","@b_misa","@FabriceCouste","@barbara_prose","@lelia2m","@brunoaskenazi","@laurenechamp","@ysisbox","@juliengagliardi","@PierreLel","@kdeniau","@_TerraInc","@DominicArpin","@antoinfonteneau","@nanotousch","@jb_roch","@YaniKhezzar","@Anne_Bechet","@NCapart","@SamyBenNaceur","@Joumany","@Julietteraynal","@TGiraudet","@SaraTanit","@HappeFrederic","@antoinellorca","@michelpicot","@Sev_Ryne","@bobdobolino","@murdever","@YGrandmontagne","@Mnyo","@EdKOSCIANSKI","@tnoisette","@jankari","@delbello_rom","@rflechaux","@NadiaSorelli","@IT_Digital","@abarbaux","@PhilippeLeroy","@schaptal","@marionspee","@lisavignoli","@ChloeAeberhardt","@MartineJacot","@JuliaPascualita","@curieusedetout","@sgraveleau","@bif_o","@ElisaPineau","@zinebdryef","@apiquard","@pierrehaski","@StephanieDelmas","@Blandine_Garot","@vergara_i","@evan_lebastard","@SophieVclt","@OlivierLevrault","@alicedorgeval","@LouiseMalnoy","@alix_fx","@pierre_baudis","@LucMagoutier","@AgatheMuller","@SGianninelli","@PaulineBoyer33","@NaomiHalll","@romaindlx","@marionbr","@Burtschy","@JacobEtienne","@as_lizzani","@marie_simon","@LaureDaussy","@FabriceAmedeo","@min","@LoubnaChlaikhy","@PlummerWilliam","@OlivierMarin1","@alaurefremont","@mwesfreid","@ChBaDe","@pmathon","@theobaldmarie","@Lnpagesy","@marclandre","@paoliniesther","@Feertchak","@JBLitzler","@GuillaumeErrard","@quentinperinel","@TristanQM","@mlbo","@constancejamet","@LoraTerrazas","@emiliegeffray","@Mathilde_Sd","@CaroPiquet","@DCanivez","@TIM_7375","@blandinelc","@ivanrioufol","@arthurberdah","@SarahLecoeuvre","@guillaume_gui","@DamienMercereau","@W_Chloe","@Assma_MD","@EugenieBastie","@HiTech_lexpress","@bcondominas","@Laurie_Z_","@jeanfrancgerard","@MathieuPagura","@BGUYF","@AlainPiffaretti","@AudreyKucinskas","@julienhory","@Pierrefalga","@TiphThuillier","@cdaniez","@LigerBaptiste","@D_Peras","@julie_dlb","@Fatiha_Temmouri","@julian2lamancha","@GaetaneDeljurie","@JulianMattei","@M_Vicuna","@DeBruynOlivier","@Nehed_Jendoubi","@antoine_grenapi","@ColonnaGen","@VictoriaGairin","@Clement_Lacombe","@TVigoureux","@MargauxObriot","@solinedelos","@RocheSabine","@dangerkens","@EdouardDutour","@MDondeyne","@DupuisNathalie1","@bouscarel","@Mathieu2jean","@Sophie_T_J","@laurentcalixte","@patrockwilliams","@PascaleKremer","@AlexJaquin","@LauraIsaaz","@cath_robin","@Del_Gautherin","@Isaduriez","@lucietuile","@AugeyBastien","@mcastagnet","@AminaKalache","@mvaudano","@CParrot","@ombelinetips","@_JoinLion","@BarbolosiRose","@ToiBruno1","@FloraClodic","@xjbdx","@ceci_est_un_handle_vraiment_long","@AlexiaEy","@Emjy_STARK","@elcoco01","@rabilebon","@pflovens_","@FabriceFrossard","@MorganeSERRES","@MarjolaineKoch","@edgarsnow","@SRNLF","@CChassigneux","@KerinecMoran","@NassiraELM","@NewsRicard","@Sandreene","@Emilezrt","@Pierre_Do","@Micode","@CColumelli","@DavidAbiker","@ClementBergantz","@benjaminrabier","@celinekallmann","@edwyplenel","@C_Barbier","@JJBourdin_RMC","@LaurenceFerrari","@aslapix","@IsaMillet","@MaximeSwitek","@tomjoubert","@jszanchi","@roqueeva","@XavierBiseul","@florencesantrot","@AntoineCrochet","@freeman59","@MaudeML","@philippe_gulpi","@mathieum76","@kiouari","@imanemoustakir","@BenedicteMallet","@Emilie_Brouze","@antoinebarret","@_nicolasbocquet","@remibuhagiar","@CourretB","@AymericRobert","@miraelmartins","@pmaniere","@jesuisraphk","@David_Ingram","@pcelerier","@technomedia","@Geraldinedauver","@ThierryLabro","@Newsdusud","@nrauline","@gbregeras","@SCouasnonBFM","@actualites_nrv","@dimitrimoulins","@oli_aura","@FabieChiche","@Vincent_Raimblt","@ChristophGreuet","@PAlbuchay","@MarrauddesGrot","@vtalmon","@cedric","@olivierfrigara","@Julien_Jay","@LydiaBerroyer","@Shuua","@datisdaz","@Steuph","@ameliecharnay","@Bruno_LesNums","@LelloucheNico","@CciliaDiQuinzio","@Elodie_C","@SylvRolland","@Kocobe","@FL_Debes","@jdupontcalbo","@GarciaVictor_","@NicoRichaud","@RHoueix","@simottel","@DamienLicata","@annabelle_L","@Lea_Lejeune","@axel_deb","@marin_eben","@ptiberry","@MatthieuDelach","@sandrinecassini","@benjaminferran","@ppgarcia75","@NotPatrick","@ivalerio","@FabienneSchmitt","@alexgoude","@JeromeColombain","@manhack","@Capucine_Cousin","@Fsorel","@oliviertesquet","@marjoriepaillon","@ginades","@PierreTran","@DelphineCuny","@reesmarc","@lauratenoudji","@ldupin","@carolinedescham","@Lucile_Quillet","@cgabizon","@Allocab","@epenser","@JAGventeprivee","@frwrds","@Laure__Bourdon","@Xavier75","@maximeverner","@s_jourdain","@LoriHelloc"]
#appelle la méthode principale 
perform(journalists_list)
