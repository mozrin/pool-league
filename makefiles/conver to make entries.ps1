# Copy and paste these into your terminal for quick access to these commands via powershell for your Docker containers.
#
# In many cases regular/local commands named build, composer, etc may be available. This is why I
# included ! at the end of each command. You canb change at your discretion.
#

function composer! { docker-compose run --rm composer $args }

function tinker! { docker-compose run --rm artisan tinker $args }

function help! { docker-compose run --rm artisan help $args }

function artisan! { docker-compose run --rm artisan $args }

function config-cache! { docker-compose run --rm artisan config:cache }

function config-clear! { docker-compose run --rm artisan config:clear }

function cache-clear! { docker-compose run --rm artisan cache:clear }

function a! { docker-compose run --rm artisan $args }

function migrate! { docker-compose run --rm artisan migrate $args }

function make! { docker-compose run --rm artisan make:$args }

function wipe! { docker-compose run --rm artisan db:wipe }

function seed! { docker-compose run --rm artisan db:seed }

function up! { docker-compose up -d }

function up!b! { docker-compose up -d --build app }

function down! { docker-compose down }

function build! { docker-compose build app }

function dumpautoload! { docker-compose run composer dump-autoload }

function clear-all! {

    config-cache!
    config-clear!
    cache-clear!

}

function reset! {

    wipe!
    migrate!
    seed!
    config-clear!
    cache-clear!
    config-cache!
}

function reseed! {
    wipe!
    migrate!
    seed!
}

function rebuild! {

    $containerStatus = docker-compose ps -q

    if ($containerStatus) {
        # Container is up, so run docker-compose down
        docker-compose down
    } 
    else {
        Write-Host "Container is not running."
    }
    
    up!b!
    wipe! -ErrorAction continue
    migrate!
    seed!

}